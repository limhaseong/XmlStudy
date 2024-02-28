/*========================================================================
 	mkDAO.java
 	- DAO 구성
 	- XML DOM 활용 → 원격 XML 읽어내기
 	  (https://www.mk.co.kr/rss/40300001/)
========================================================================*/

package com.test;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class mkDAO
{
	// 공통 멤버 구성
	private Document xmlObj;
	private XPath xPath;
	
	// 생성자 정의 → 기본 생성자
	public mkDAO() throws ParserConfigurationException, IOException, SAXException
	{
		this("40300001"); // 전체 뉴스
	}
	
	// 생성자 정의 → 매개변수 있는 생성자
	public mkDAO(String mkId) throws ParserConfigurationException, IOException, SAXException
	{
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		
		String str = String.format("https://www.mk.co.kr/rss/%s/", mkId);
		URL url = new URL(str);
		InputSource is = new InputSource(url.openStream());
		
		xmlObj = builder.parse(is);
		xPath = XPathFactory.newInstance().newXPath();
	}
	
	//<title>
	public String mkTitle() throws XPathExpressionException
	{
		String result = "";
		
		result = xPath.compile("rss/channel/item/title").evaluate(xmlObj);
		
		return result;
	}
	
	//<link>
	public String mkLink() throws XPathExpressionException
	{
		String result = "";
		
		result = xPath.compile("rss/channel/item/link").evaluate(xmlObj);
		
		return result;
	}
	
	//<category>
	public String mkCategory() throws XPathExpressionException
	{
		String result = "";
		
		result = xPath.compile("rss/channel/item/category").evaluate(xmlObj);
		
		return result;
	}
	
	//<description>
	public String mkDescription() throws XPathExpressionException
	{
		String result = "";
		
		result = xPath.compile("rss/channel/item/description").evaluate(xmlObj);
		
		return result;
	}
	
	//<author>
	public String mkAuthor() throws XPathExpressionException
	{
		String result = "";
		
		result = xPath.compile("rss/channel/item/author").evaluate(xmlObj);
		
		return result;
	}
	
	//<pubDate>
	public String mkPubDate() throws XPathExpressionException
	{
		String result = "";
		
		result = xPath.compile("rss/channel/item/pubDate").evaluate(xmlObj);
		
		return result;
	}
	
	// 뉴스 카테고리 배열
	public ArrayList<String> mkTitleList() throws XPathExpressionException
	{
		ArrayList<String> result = new ArrayList<String>();
		
		NodeList mkNodeList = (NodeList)xPath.compile("rss/channel/item/category").evaluate(xmlObj, XPathConstants.NODESET);
		
		for (int i = 0; i < mkNodeList.getLength(); i++)
		{
			Node mkNode = mkNodeList.item(i);
			result.add(mkNode.getTextContent());
		}
		return result;
	}

	
	// 뉴스 정보 리스트 구성
	public ArrayList<mkDTO> mkList(String idx) throws XPathExpressionException
	{
		ArrayList<mkDTO> result = new ArrayList<mkDTO>();
		
		NodeList itemList = (NodeList)xPath.compile(String.format("rss/channel/item[%s]", idx)).evaluate(xmlObj, XPathConstants.NODESET);
		
		for (int i = 1; i <= itemList.getLength() ; i++)
		{
			String title = xPath.compile(String.format("rss/channel/item[%s]/title[%s]", idx, i)).evaluate(xmlObj);
			String link = xPath.compile(String.format("rss/channel/item[%s]/link[%s]", idx, i)).evaluate(xmlObj);
			String category = xPath.compile(String.format("rss/channel/item[%s]/category[%s]", idx, i)).evaluate(xmlObj);
			String description = xPath.compile(String.format("rss/channel/item[%s]/description[%s]", idx, i)).evaluate(xmlObj);
			String author = xPath.compile(String.format("rss/channel/item[%s]/author[%s]", idx, i)).evaluate(xmlObj);
			String pubDate = xPath.compile(String.format("rss/channel/item[%s]/pubDate[%s]", idx, i)).evaluate(xmlObj);
			
			mkDTO mk = new mkDTO();
			mk.setTitle(title);
			mk.setLink(link);
			mk.setCategory(category);
			mk.setDescription(description);
			mk.setAuthor(author);
			mk.setPubDate(pubDate);
			
			result.add(mk);
			
		}
		
		return result;
	}
}
