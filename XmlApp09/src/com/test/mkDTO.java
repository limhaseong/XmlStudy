/*=================
 	mkDTO.java
=================*/

package com.test;

public class mkDTO
{
	// 주요 속성 구성
	private String title, link, category, description, author, pubDate;
	//              제목  링크  카테고리    내용       출판사   날짜

	// getter / setter 구성
	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getLink()
	{
		return link;
	}

	public void setLink(String link)
	{
		this.link = link;
	}

	public String getCategory()
	{
		return category;
	}

	public void setCategory(String category)
	{
		this.category = category;
	}

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public String getAuthor()
	{
		return author;
	}

	public void setAuthor(String author)
	{
		this.author = author;
	}

	public String getPubDate()
	{
		return pubDate;
	}

	public void setPubDate(String pubDate)
	{
		this.pubDate = pubDate;
	}
}
