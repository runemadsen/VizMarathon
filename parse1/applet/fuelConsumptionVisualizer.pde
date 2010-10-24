import toxi.geom.*;
import toxi.math.*;

public class FuelConsumptionVisualizer extends AbstractVisualizer
{
  private HashMap data = new HashMap();
  private int curYear = 2007;
  private String countryCode;
    //  private InterpolateStrategy is=new CircularInterpolation(true);

  public FuelConsumptionVisualizer() {
    parseCsv();
  }
  
  private void parseCsv() {
    String[] lines = loadStrings("fuelConsumption.csv");
    String[] cols = lines[0].split(",");
    int[] years = new int[cols.length-2];
      for (int i = 0; i < years.length; i++) {
      years[i] = Integer.parseInt(cols[i+2]);
    }

    for(int i = 1; i < lines.length; i++) {
      String chunks[] = lines[i].split(",");

      HashMap fuelPerYear = new HashMap(years.length);
      for (int y=0; y < years.length; y++) {
        fuelPerYear.put(years[y], Float.parseFloat(chunks[y+2].length() == 0 ? "0" : chunks[y+2]));
      }

      data.put(chunks[0].trim(), fuelPerYear);
    }
  }

  public void setYear(int year) {
    curYear = constrain(year, 1960, 2007);
  }

  public void display(){
    
  }

  public void display(float total) {
    smooth();
    noStroke();
    
    fill(200, 100, 100);
    

      HashMap hm = (HashMap)data.get("WLD");
      float sum = (Float)hm.get(curYear);
      
    
    rect(0, -(500*sum/total)/2, 20, 500*sum/total);
    text(sum/total + "avg personal fuel consumption in kT of oil equivalent", 30, 0);
   // println(sum);
   
  }

  public String getTitle() {
    return "Fuel Consumption %";
  }

  public boolean setCountry(String countryCode) {
    this.countryCode = countryCode;
    return true;
  }
}

