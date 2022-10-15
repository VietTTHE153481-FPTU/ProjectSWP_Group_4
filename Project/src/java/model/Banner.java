/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.AllArgsConstructor;
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

public class Banner {
    private int ID;
    private String Img;
    private String Title;
    private String desc;

    public Banner() {
    }

    public Banner(int ID, String Img, String Title, String desc) {
        this.ID = ID;
        this.Img = Img;
        this.Title = Title;
        this.desc = desc;
    }
    
    
}
