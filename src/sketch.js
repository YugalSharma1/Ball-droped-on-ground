function setup() {
    createCanvas(window.innerWidth, window.innerHeight);
}
let dropped = false;
let radius = 80;
let dampen = 10;
let x, y;
let a = 1.8;
let v = 0;

function draw() {
    if (mouseIsPressed) {
        fill(0);
        dropped = true;
    } else {
        fill(200);
    }

    if (!dropped) {
        clear();
        x = mouseX;
        y = mouseY;
        circle(x, y, radius);
    }
    else {
        y += v;
        v += a;
        clear();
         if (y > window.innerHeight - radius) {
            y = window.innerHeight - radius;
            v -= Math.max(dampen, 0.1 * Math.abs(v));
            //v-=dampen;
            v = -v;
            print(v);
        }
        circle(x, y, radius);
     



    }
}
