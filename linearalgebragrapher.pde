import controlP5.*;

Slider xslider;
ControlP5 cp5;
float[] ih = {1, 0};
float[] jh = {0, 1};
int scalex=20/**(ih[0]+jh[0])*/;
int scaley=20/**(ih[1]+jh[1])*/;

void setup(){
	size(1000,1000);
	background(0, 0, 0);
	stroke(255, 255, 255);
	fill(255, 255, 255);
    cp5 = new ControlP5(this);
    cp5.addSlider("ih[0]")
        .setPosition(0,0)
        .setRange(-2, 2)
        .setValue(1)        
        ;
        
    cp5.addSlider("ih[1]")
        .setPosition(0,10)
        .setRange(-2, 2)
        .setValue(0)
        ;

    cp5.addSlider("jh[0]")
        .setPosition(0,20)
        .setRange(-2, 2)
        .setValue(0)
        ;
        
    cp5.addSlider("jh[1]")
        .setPosition(0,30)
        .setRange(-2, 2)
        .setValue(1)
        ;
}

void draw(){
    ih[0]=cp5.getController("ih[0]").getValue();
    ih[1]=cp5.getController("ih[1]").getValue();
    jh[0]=cp5.getController("jh[0]").getValue();
    jh[1]=cp5.getController("jh[1]").getValue();
	background(0, 0, 0);
    stroke(255, 255, 255);
    for(int i = -scalex/2; i<scalex/2; i++){
        line(conv(i, scalex/2)[0], conv(i , scalex/2)[1], conv(i, -scalex/2)[0], conv(i, -scalex/2)[1]);
    }

    for(int j = -scaley/2; j<scaley/2; j++){
        line(conv(scaley/2, j)[0], conv(scaley/2, j)[1], conv(-scaley/2, j)[0], conv(-scaley/2, j)[1]);
    }  

    stroke(255, 0, 0);
    line(conv(0,0)[0], conv(0,0)[1], conv(1, 0)[0], conv(1, 0)[1]);
    line(conv(0,0)[0], conv(0,0)[1], conv(0, 1)[0], conv(0, 1)[1]);
}

float[] conv(float x, float y){
    return(new float[]{(1000/scalex)*(ih[0]*x+ih[1]*y)+500, (-1000/scaley)*(jh[0]*x+jh[1]*y)+500});
}
