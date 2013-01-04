BMO_WIDTH=50;
BMO_HEIGHT=75;
BMO_DEPTH=30;

module edgeprofile(length, radius, rotate)
{
	rotate(rotate, [0, 0, 1])
	render(convexity = 2) difference() {
		cube([radius+10, radius+10, length+10], center = true);
		translate([-10, -10, 0])
			cylinder(h = length+10, r = radius, center = true);
	}
}

module bmo(width, height, depth)
{
	RADIUS=10;
	render(convexity=2) {
		difference() {
			cube([height, width, depth], center=true);
			cube([height-RADIUS*2, width-RADIUS, depth+10], center=true);
			translate([height/2, width/2, 0]) {
				edgeprofile(depth, RADIUS, 0);
			}
			translate([-height/2, width/2, 0]) {
				edgeprofile(depth, RADIUS, 90);
			}
			translate([-height/2, -width/2, 0]) {
				edgeprofile(depth, RADIUS, 180);
			}
			translate([height/2, -width/2, 0]) {
				edgeprofile(depth, RADIUS, 270);
			}
		}
	}
}

bmo(BMO_WIDTH, BMO_HEIGHT, BMO_DEPTH);