document.addEventListener("DOMContentLoaded", function(){
  const canvas = setCanvas(500, 500);
  drawCircle(canvas);
  drawRect(canvas);
});

function setCanvas(width, height) {
  const canvas = document.getElementById('mycanvas');
  canvas.height = width;
  canvas.width = height;

  return canvas;
}

function drawRect(canvas) {
  const ctx = canvas.getContext('2d');

  ctx.fillStyle = "rgb(255, 0, 0)";
  ctx.fillRect(10, 10, 100, 40);
}

function drawCircle(canvas) {
  const ctx = canvas.getContext('2d');
  
  ctx.beginPath();
  ctx.arc(200, 200, 100, 0, 2 * Math.PI);
  ctx.strokeStyle = "rgb(0, 0, 0)";
  ctx.lineWidth = 20;
  ctx.stroke();
  ctx.fillStyle = "rgb(255, 0, 0)";
  ctx.fill();
}