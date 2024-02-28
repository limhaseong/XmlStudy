/*============================================
 	XmlDomTest05.java
 	- 콘솔 기반 자바 프로그램
 	- XML DOM 활용 → 로컬(local) XML 읽어내기
 	  (VEHICLES.xml)
============================================*/

/*
----------------------------------------------------------------
NO	MAKE		MODEL		YEAR	STYLE			PRICE
----------------------------------------------------------------
1	Dodge		Durango		1998	Sport Utility	18000
Options --------------------------------------------------------
		Power_Locks : Yes
		Power_Window : Yes
		Stereo : Radio/Cassette/CD
		Air_Conditioning : Yes
		Automatic : Yes
		Four_Wheel_Drive : Full/Partial
		Note : Very clean
----------------------------------------------------------------
2	Honda		Civic		1997	Sedan			8000
Options --------------------------------------------------------
		Power_Locks : Yes
		Power_Window : Yes
		Stereo : Radio/Cassette
		Automatic : Yes
		Note : Like New
----------------------------------------------------------------
*/

package com.test;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlDomTest05
{
	public static void main(String[] args)
	{
		try
		{
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document xmlObj = null;
			
			String url = "VEHICLES.xml";
			xmlObj = builder.parse(url);
			
			Element root = xmlObj.getDocumentElement();
			
			NodeList vehiNodeList = root.getElementsByTagName("VEHICLE");
			
			System.out.println("---------------------------------------------------------------------");
			System.out.println("NO  MAKE		MODEL		YEAR	STYLE			PRICE");
			System.out.println("---------------------------------------------------------------------");
			
			for (int i = 0; i < vehiNodeList.getLength(); i++)
			{
				Node vehiNode = vehiNodeList.item(i);
				
				Element vehiElement = (Element)vehiNode;
				
				//System.out.printf("%s%n "
				//, vehiElement.getElementsByTagName("INVENTORY_NUMBER").item(0).getTextContent());		//--> getText() 메소드를 사용 안했을 시
				
				
				System.out.printf("%s   %s\t      %s\t        %s\t  %s\t       %s%n"
						, getText(vehiElement, "INVENTORY_NUMBER")
						, getText(vehiElement, "MAKE")
						, getText(vehiElement, "MODEL")
						, getText(vehiElement, "YEAR")
						, getText(vehiElement, "STYLE")
						, getText(vehiElement, "PRICE"));
				
				System.out.println("Options ------------------------------------------------------------");
				
				// option추가
				NodeList optionNodeList = vehiElement.getElementsByTagName("OPTIONS");
				
				if (optionNodeList.getLength() > 0)
				{
					Node opNode = optionNodeList.item(0);
					Element optionElement = (Element)opNode;
					
					
					
					
					NodeList optiNodeList = optionElement.getChildNodes();
					
					for (int j = 0; j < optiNodeList.getLength(); j++)
					{
						Node optionNode = optiNodeList.item(j);
						if (optionNode.getNodeType()==1)
						{
							Element optionElememt = (Element)optionNode;
							System.out.printf("%s : %s", optionElememt.getTagName(), optionElememt.getTextContent());
							//										  ==getNodeName()
						}
						System.out.println();
						
					}
				}
				
				
				System.out.println("---------------------------------------------------------------------");

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
