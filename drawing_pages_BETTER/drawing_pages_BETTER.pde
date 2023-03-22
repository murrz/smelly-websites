/** 
 * Multi Page Buttons (v1.7)
 * by GoToLoop (2013/Oct)
 *
 * Forum.Processing.org/two/discussion/558/creating-a-next-page-button#Item_8
 * Studio.ProcessingTogether.com/sp/pad/export/ro.9eDRvB4LRmLrr
 */

static final int MAX = 2, GAP = 50, DIM = 120, RAD = DIM >> 1;
int page, cx, cy;

Button back, next;

void setup() {
  size(800, 800);

  noLoop();
  smooth();

  rectMode(CORNER);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);

  stroke(0);
  strokeWeight(0.5);

  cx = width  >> 1;
  cy = height >> 1;

  back = new Button("Hang back", GAP, height - Button.H - GAP);
  next = new Button("Let's go", width - Button.W - GAP, height - Button.H - GAP);
}

void draw() {
  background(0300);

  textSize(0100);
  fill(Button.TXTC);
  text("Page #" + page, cx, cy);

  textSize(Button.TXTSZ);
  if (page > 0)    back.display();
  if (page < MAX)  next.display();

  method("page" + page); // Works on Java Mode only!
  //pageSelector();        // Workaround for PJS. But works on Java Mode as well!
}

void mousePressed() {
  if      (page > 0   && back.isHovering)  --page;
  else if (page < MAX && next.isHovering)  ++page;

  redraw();
}

void mouseMoved() {
  back.isInside();
  next.isInside();

  redraw();
}

void page0() {
  fill(#FF00FF);
  ellipse(cx, GAP*2, DIM, DIM);
}

void page1() {
  fill(#FFFF00);
  rect(cx - RAD, GAP*2 - RAD, DIM, DIM);
}

void page2() {
  fill(#008000);
  triangle(cx, GAP*2 - RAD, cx - RAD, GAP*2 + RAD, cx + RAD, GAP*2 + RAD);
}

void pageSelector() { // Replaces method("") for PJS
  switch(page) {
  case 0: 
    page0();
    break;

  case 1: 
    page1();
    break;

  case 2: 
    page2();
  }
}

class Button {
  static final int W = 80, H = 40, TXTSZ = 020;
  static final color BTNC = #00A0A0, HOVC = #00FFFF, TXTC = 0;

  final String label;
  final int x, y, xW, yH;

  boolean isHovering;

  Button(String txt, int xx, int yy) {
    label = txt;

    x = xx;
    y = yy;

    xW = xx + W;
    yH = yy + H;
  }

  void display() {
    fill(isHovering? HOVC : BTNC);
    rect(x, y, W, H);

    fill(TXTC);
    text(label, x + W/2, y + H/2);
  }

  boolean isInside() {
    return isHovering = mouseX > x & mouseX < xW & mouseY > y & mouseY < yH;
  }
}
