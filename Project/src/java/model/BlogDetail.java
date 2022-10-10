/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author trung
 */
@Getter
@Setter
@ToString
@Builder
public class BlogDetail {
    private int BlogDetailID;
    private String Title;
    private String Content;
    private String imgBlogDetail;
    private int BlogID;

}
