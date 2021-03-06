% Calculates a transformation that aligns the points points1 and points2 
% using RANSAC.
% transMode: aff_lsq  - Affine mapping
%            proj_svd - Homography
% n_pts:     size of point sample
% Return values:
% T_im1:     a tform object encalpsulating the transformation from image1
%            (points1) onto image2 (points2)
% best_pts:  points used to estimate best transformation (Dim: n_pts x 4)
% num_inliners: the number of the inliners found by RANSAC
function [ T_im1, best_pts, num_inliners, pt_inliners ] = ransac( points1, points2, n_pts )

disp('Performing RANSAC');
t = tic();

best_n_inliers = -1;
idx_best = zeros(n_pts,1);
pt_inliners = zeros(length(points1),4); % save the inliner points
n_iters = 2 ^ n_pts * 50; % Iteration rule of thumb :)

if n_iters > 5048
    n_iters = 5048;
end
fprintf('RANSAC Progress (%i iterations): <*- 0%%',n_iters)
for i = 1:n_iters
    
    % progressbar
    if mod(i,floor(n_iters/10))==0
        fprintf('\b\b\b\b*-%i%%',floor(100.0*i/n_iters))
    end
    
    % Create a set of 'n_pts' unique point indices
    idxset = 1:length(points2(:,1));
    idxs=zeros(n_pts,1);
    for j = 1:n_pts
        idx=randi(length(idxset)-j+1);
        idxs(j)=idxset(idx);
        idxset(idx:end-1)=idxset(idx+1:end);
    end
    
    % Calculate the transformation
    warning off all
    T = homography_svd(points1(idxs,:), points2(idxs,:));
    warning on all
    % transformation check
    if max(max(isnan(T.tdata.T)))==1
        disp('nan');
        continue
    end
    
    % Apply the transformation ...
    [A_X A_Y] = tformfwd(T,points1(:,1),points1(:,2));
    dXsq = (A_X - points2(:,1)).^2;
    dYsq = (A_Y - points2(:,2)).^2;
    
    % .. and count the amount of inliers
    n_inliers=0;
    for i = 1:length(dXsq)
        e=sqrt(dXsq(i)+dYsq(i));
        if e <= 2 % inlier radius in px
            n_inliers=n_inliers+1;
            pt_inliners(i,1) = points2(i,1);
            pt_inliners(i,2) = points2(i,2);
            pt_inliners(i,3) = points1(i,1);
            pt_inliners(i,4) = points1(i,2);
        end
    end
    
    % improvment check
    if n_inliers > best_n_inliers
        best_n_inliers = n_inliers;
        T_im1 = T;
        num_inliners = best_n_inliers;
        idx_best = idxs;
    end
end
fprintf('>\n')

disp('Inliers:');
disp(num_inliners);

best_pts=zeros(length(idx_best),4);
best_pts(:,[1 2])=points1(idx_best,:);
best_pts(:,[3 4])=points2(idx_best,:);
disp('done.')
toc(t)

end
