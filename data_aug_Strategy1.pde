ArrayList<PImage> images;
PImage img;
ArrayList<String> categories;
ArrayList<String> artistNames;
String imageName;
String filePath;
boolean exists;
int count;
int i;

void setup(){ //<>// //<>//
  System.out.println("here");
  categories = new ArrayList<String>();
  categories.add("impressionist");
  size(250,250); //<>//
  count = 0; //<>//
  images = new ArrayList<PImage>();
  artistNames = new ArrayList<String>();
  artistNames.add("Alfred_Sisley");
  artistNames.add("Amedeo_Modigianai");
  artistNames.add("Camille_Pissarro");
  artistNames.add("Diego_Velasquez");
  artistNames.add("Edgar_Degas");
  artistNames.add("Edouard_Manet");
  artistNames.add("Edvard_Munch");
  artistNames.add("Frida_Kahlo");
  artistNames.add("Georges_Seurat");
  artistNames.add("Gustav_Klimt");
  artistNames.add("Henri_de_Toulouse-Lautrec");
  artistNames.add("Henri_Matisse");
  artistNames.add("Henri_Rousseau");
  artistNames.add("Kazimir_Malevich");
  artistNames.add("Marc_Chagall");
  artistNames.add("Mikhail_Vrubel");
  artistNames.add("Pablo_Picasso");
  artistNames.add("Paul_Cezanne");
  artistNames.add("Pierre-Auguste_Renoir");
  artistNames.add("Piet_Mondrian");
  artistNames.add("Pieter_Bruegel");
  artistNames.add("Rene_Magritte");
  artistNames.add("Salvador_Dali");
  artistNames.add("Vasiliy_Kandinski");
  artistNames.add("Vincent_van_Gogh");
  artistNames.add("William_Turner");
  print("wakaa");
  
}

ArrayList<PImage> splitter(PImage img){
      int wid = img.width;
      int hei = img.height;
      image(img,0,0,width,height);
      PImage topLeft0 = get(0, 0, int(.9*wid), int(.9*hei));
      topLeft0.resize(width,height);
      PImage topRight0 = get(int(.1*wid), 0, int(.9*wid), int(.9*hei));
      topRight0.resize(width,height);
      PImage bottomLeft0 = get(0, int(.1*hei), int(.9*wid), int(.9*hei));
      bottomLeft0.resize(width,height);
      PImage bottomRight0 = get(int(.1*wid), int(.1*hei), int(.9*wid), int(.9*hei));
      bottomRight0.resize(width,height);
      PImage center = get(int(.05*wid), int(.05*hei), int(.9*wid), int(.9*hei));
      center.resize(width,height);
     
      ArrayList<PImage> newimages = new ArrayList<PImage>();
      
      newimages.add(topLeft0);
      newimages.add(topRight0);
      newimages.add(bottomLeft0);
      newimages.add(bottomRight0);
      newimages.add(center);
      return newimages;
}

void draw(){ //<>// //<>//
  println(count);
  println("img "+images.size());
  if (count==0){
    for (String c:categories){
      for (String a: artistNames){
        println(a);
        for (int i = 0; i<200; i++){
          if (i%10==0) print(i+" ");
          File f = dataFile(c+"/"+a+"/"+a+"_"+i+".jpg");
          filePath = f.getPath();
          exists= f.isFile();
          if(exists){
            img = loadImage(c+"/"+a+"/"+a+"_"+i+".jpg");
            images.addAll(splitter(img));
          }
        }
      }
    }
  }
  else if(count<images.size()){
    print("image");
    delay(10);
    background(0,0,0);
    image(images.get(count),0,0);
    save("impressionists/color"+count+".jpg");
    images.get(count).filter(GRAY);
    image(images.get(count),0,0);
    save("impressionists/bw"+count+".jpg");
  }
  else {
    exit();
  }
  count++; 
}
