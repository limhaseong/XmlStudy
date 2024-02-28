/*============================================
 	XmlDomTest03.java
 	- 콘솔 기반 자바 프로그램
 	- XML DOM 활용 → 로컬(local) XML 읽어내기
 	  (memList.xml)
============================================*/

package com.test;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlDomTest03
{
	public static void main(String[] args)
	{
		try
		{
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document xmlObj = null;
			
			String url = "memList.xml";
			xmlObj = builder.parse(url);
			
			Element root = xmlObj.getDocumentElement();
			
			NodeList memNodeList = root.getElementsByTagName("memberInfo");
			
			for (int i = 0; i < memNodeList.getLength(); i++)
			{
				Node memNode = memNodeList.item(i);
				
				Element memElement = (Element)memNode;
				
				System.out.printf("%s %s %s %s %s%n"
						, getText(memElement, "name")
						, getText(memElement, "telephone")
						, getText(memElement, "zipCode")
						, getText(memElement, "email")
						, getText(memElement, "year"));
				
				NodeList currNodeList = memElement.getElementsByTagName("curriculumn");
				
				if (currNodeList.getLength() > 0)
				{
					Node currNode = currNodeList.item(0);
					Element currElement = (Element)currNode;
					
					NodeList subNodeList = currElement.getElementsByTagName("sub");
					for (int j = 0; j < subNodeList.getLength(); j++)
					{
						Node subNode = subNodeList.item(j);
						Element subElement = (Element)subNode;
						System.out.printf("%s ", subElement.getTextContent());
					}
					System.out.println();
				}
				
				NodeList addrNodeList = memElement.getElementsByTagName("addr");
				for (int j = 0; j < addrNodeList.getLength(); j++)
				{
					Node addrNode = addrNodeList.item(j);
					if (addrNode.getNodeType() == 1)
					{
						Element addrElement = (Element)addrNode;
						System.out.printf("%s ", addrElement.getTextContent());
					}
					System.out.println();
					System.out.println();
				}
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	
	private static String getText(Element parent, String tagName)
	{
		String result = "";
		
		// 대상 태그(tagName) 객체의 첫 번째 자식 노드 얻어오기
		Node node = parent.getElementsByTagName(tagName).item(0);
		Element element = (Element)node;
		
		// 대상 엘리먼트(element)의 자식 노드(텍스트 노드)의 값 얻어오기
		result = element.getChildNodes().item(0).getNodeValue();
		
		return result;
	}
}
