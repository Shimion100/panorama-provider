// ��� MFC ʾ��Դ������ʾ���ʹ�� MFC Microsoft Office Fluent �û����� 
// ("Fluent UI")����ʾ������Ϊ�ο������ṩ�� 
// ���Բ��䡶Microsoft ������ο����� 
// MFC C++ �������渽����ص����ĵ���
// ���ơ�ʹ�û�ַ� Fluent UI �����������ǵ����ṩ�ġ�
// ��Ҫ�˽��й� Fluent UI ���ɼƻ�����ϸ��Ϣ�������  
// http://msdn.microsoft.com/officeui��
//
// ��Ȩ���� (C) Microsoft Corporation
// ��������Ȩ����

// StreetViewDoc.h : CStreetViewDoc ��Ľӿ�
//


#pragma once


class CStreetViewDoc : public CDocument
{
protected: // �������л�����
	CStreetViewDoc();
	DECLARE_DYNCREATE(CStreetViewDoc)

// ����
public:

// ����
public:

// ��д
public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);

// ʵ��
public:
	virtual ~CStreetViewDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// ���ɵ���Ϣӳ�亯��
protected:
	DECLARE_MESSAGE_MAP()
};

