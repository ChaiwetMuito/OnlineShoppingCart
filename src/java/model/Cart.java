/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Enumeration;
import java.util.Vector;

/**
 *
 * @author YUME
 */
public class Cart {
    private double totalPrice;
    static int cartid;
    protected Vector item;
    
    public Cart(){
        item = new Vector();
    }
    
    public Vector getItem(){
        return (Vector) item.clone();
    }
    
    public void addItam(Dvd newItem){
        Boolean flag = false;
        if(item.size()==0){
            item.addElement(newItem);
            return;
        }
        for(int i=0; i < item.size(); i++){
            Dvd dc = (Dvd) item.elementAt(i);
            if(dc.getDvdname().equals(newItem.getDvdname())){
                dc.setQuantity(newItem.getQuantity()+dc.getQuantity());
                item.setElementAt(dc, i);
                flag = true;
                break;
            }
        }
        if(newItem.getQuantity() > 0 && (flag == false)){
            item.addElement(newItem);
        }
    }
    
    public void removeItem (int itemIndex){
        item.removeElementAt(itemIndex);
    }
    
    public void calTotal (){
        Enumeration dc = item.elements();
        while(dc.hasMoreElements()){
            Dvd item = (Dvd) dc.nextElement();
            
            totalPrice = totalPrice + item.getPrice() * item.getQuantity();
        }
    }
    public double getTotal(){
        return this.totalPrice;
    }
    
    
}
