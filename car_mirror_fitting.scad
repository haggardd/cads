width = 82.5;
pinLength = 100;
pinRadius = 5;
pinDiameter = pinRadius * 2;
pinPosition = width / 2 - pinRadius;
notchDepth = 2;
notchTranslation = [(pinPosition - pinDiameter) + notchDepth, 0, -30.4];

minkowski()
{
  cube([width, 10, 10], true);
  cylinder(1, 2, 2, $fn=360);
}

translate([-pinPosition, 0, -55]) 
    cylinder(pinLength, 5, 5, true, $fn=360);

difference(){
    translate([pinPosition ,0, -55])
        cylinder(pinLength, 5, 5, true, $fn=360);
    
    translate(notchTranslation)
        cube([10, 10, 2], true);
    
    translate([pinPosition - 6.5, 0, -30.8])
        cylinder(15, 3.25, 1, $fn=360);
}