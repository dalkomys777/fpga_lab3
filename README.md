# FPGA LAB3

FPGA 응용회로 7개의 RTL, 테스트벤치, 핀 제약 및 사전 시뮬레이션 증빙을 정리한 저장소이다.

## 구성

- `circuits/01_led_pwm`: PWM LED 밝기 제어
- `circuits/02_rgb_pwm`: RGB LED PWM 제어
- `circuits/03_piezo`: 피에조 단일 음 출력
- `circuits/04_stepper`: 스텝모터 위상 제어
- `circuits/05_mmss_clock`: MM:SS 시계
- `circuits/06_character_lcd`: 문자 LCD 제어
- `circuits/07_uart_echo`: UART 에코
- `evidence`: 정상, 수정, 오류 및 복구 시뮬레이션 증빙
- `reports/pre`: 예비보고서
- `reports/post`: 결과보고서

`LAB3.code-workspace`를 열면 모든 회로와 회로별 시뮬레이션 작업을 한 번에 볼 수 있다.

생성된 `build` 및 Vivado 작업 폴더는 저장소에서 제외한다. 제출에 필요한 로그와 VCD는 `evidence`에 별도로 보관한다.
