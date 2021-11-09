#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
  vec2 coord = gl_FragCoord.xy / u_resolution; // 각 픽셀들 좌표값 normalize
  coord.x *= u_resolution.x / u_resolution.y; // 캔버스를 resizing 해도 왜곡이 없도록 좌표값에 해상도비율값 곰해줌.

  vec3 col;

  gl_FragColor = vec4(col, 1.);
}

/*
  보로노이(Voronoi) 다각형


  Voronoi는 다른 말로 Cellular Noise 라고도 함.
  노이즈 알고리즘의 한 종류라고 보면 됨.

  들로네 삼각분할(Delaunay triangulation) 이라는 개념과
  항상 짝지어서 같이 다닌다고 함.
  관련 내용은 구글링해서 찾아볼 것.

  이번 예제에서는 셰이더 상에서 보로노이 다각형을 그리는 방법만 알아볼 것임.


  보로노이 다각형의 원리를 간단하게 알아보면
  각 다각형을 세포라고 생각하고,
  각 다각형 내부에는 세포핵이 존재한다고 생각하면 됨.
  실제로 보로노이 다각형은 생김새가 가운데에 세포핵이 있는 세포처럼 생겼음.

  예를 들어 5개의 세포핵이 존재한다 치면,
  캔버스의 각 픽셀들의 좌표값들이 각각
  5개의 세포핵 중 어느 세포핵에 가장 가까운지 그 거리값을 판단한 뒤,
  가장 가까운 세포핵을 발견했다면,
  그 세포핵이 이루고 있는 세포로 해당 픽셀이 포함되도록 하는 거라고 보면 됨.
  
  그니까, 각 픽셀들은 가장 가까운 세포핵의 세포영역 중에 하나로
  그려지도록 색상값이 찍히겠지! 
*/