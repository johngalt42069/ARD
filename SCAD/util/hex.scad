module honeycomb(x, y, z, dia, wall, whole_only=true)  {
    // Diagram
    //          ______     ___
    //         /     /\     |
    //        / dia /  \    | smallDia
    //       /     /    \  _|_
    //       \          /   ____
    //        \        /   /
    //     ___ \______/   /
    // wall |            /
    //     _|_  ______   \
    //         /      \   \
    //        /        \   \
    //                 |---|
    //                   projWall
    //
    // a single filled hexagon
    module hexagon(xoff, yoff)  {
        radius = dia / 2;
        if (!whole_only || ((xoff - radius >= -x/2 && xoff + radius <= x/2) && (yoff - radius >= -y/2 && yoff + radius <= y/2)))
            translate([xoff, yoff]) circle(d=dia, $fn=6);
    }
    smallDia = dia * cos(30);
    projWall = wall * cos(30);
    yStep = smallDia + wall;
    xStep = dia*3/2 + projWall*2;
    yStepsCount = ceil((y/2) / yStep);
    xStepsCount = ceil((x/2) / xStep);
    linear_extrude(z) difference() {
        square([x, y],center=true);
        for (
                yOffset = [-yStep * yStepsCount : yStep : yStep * yStepsCount],
                xOffset = [-xStep * xStepsCount : xStep : xStep * xStepsCount]
        ) {
            hexagon(xOffset, yOffset);
            hexagon(xOffset + dia*3/4 + projWall, yOffset + (smallDia+wall)/2);
        }
    }
}