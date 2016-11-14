package me.iit.uni.miskolc.springbootrest;

/**
 * Created by czinke2 on 2016. 11. 14..
 */
public class Greeting {

    private final long id;
    private final String content;

    public Greeting(long id, String content) {
        this.id = id;
        this.content = content;
    }

    public long getId() {
        return id;
    }

    public String getContent() {
        return content;
    }
}
