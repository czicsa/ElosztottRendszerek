package com.iit.uni.miskolc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class A {
    private B b;

    @Autowired
    public A(B b){
        this.b = b;
    }

    public void hello(){
        this.b.bello();
    }

}
