
//input ports
add mapped point clk clk -type PI PI
add mapped point reset reset -type PI PI
add mapped point btn_mode btn_mode -type PI PI
add mapped point btn_set btn_set -type PI PI
add mapped point btn_inc btn_inc -type PI PI
add mapped point btn_dec btn_dec -type PI PI
add mapped point btn_light btn_light -type PI PI

//output ports
add mapped point h1_6 h1_6 -type PO PO
add mapped point h1_5 h1_5 -type PO PO
add mapped point h1_4 h1_4 -type PO PO
add mapped point h1_3 h1_3 -type PO PO
add mapped point h1_2 h1_2 -type PO PO
add mapped point h1_1 h1_1 -type PO PO
add mapped point h1_0 h1_0 -type PO PO
add mapped point h0_6 h0_6 -type PO PO
add mapped point h0_5 h0_5 -type PO PO
add mapped point h0_4 h0_4 -type PO PO
add mapped point h0_3 h0_3 -type PO PO
add mapped point h0_2 h0_2 -type PO PO
add mapped point h0_1 h0_1 -type PO PO
add mapped point h0_0 h0_0 -type PO PO
add mapped point m1_6 m1_6 -type PO PO
add mapped point m1_5 m1_5 -type PO PO
add mapped point m1_4 m1_4 -type PO PO
add mapped point m1_3 m1_3 -type PO PO
add mapped point m1_2 m1_2 -type PO PO
add mapped point m1_1 m1_1 -type PO PO
add mapped point m1_0 m1_0 -type PO PO
add mapped point m0_6 m0_6 -type PO PO
add mapped point m0_5 m0_5 -type PO PO
add mapped point m0_4 m0_4 -type PO PO
add mapped point m0_3 m0_3 -type PO PO
add mapped point m0_2 m0_2 -type PO PO
add mapped point m0_1 m0_1 -type PO PO
add mapped point m0_0 m0_0 -type PO PO
add mapped point s1_6 s1_6 -type PO PO
add mapped point s1_5 s1_5 -type PO PO
add mapped point s1_4 s1_4 -type PO PO
add mapped point s1_3 s1_3 -type PO PO
add mapped point s1_2 s1_2 -type PO PO
add mapped point s1_1 s1_1 -type PO PO
add mapped point s1_0 s1_0 -type PO PO
add mapped point s0_6 s0_6 -type PO PO
add mapped point s0_5 s0_5 -type PO PO
add mapped point s0_4 s0_4 -type PO PO
add mapped point s0_3 s0_3 -type PO PO
add mapped point s0_2 s0_2 -type PO PO
add mapped point s0_1 s0_1 -type PO PO
add mapped point s0_0 s0_0 -type PO PO
add mapped point colon colon -type PO PO
add mapped point light light -type PO PO

//inout ports




//Sequential Pins
add mapped point chip/fsm/next_state[1]/q chip_fsm_next_state_reg[1]/Q -type DFF DFF
add mapped point chip/fsm/next_state[0]/q chip_fsm_next_state_reg[0]/Q -type DFF DFF
add mapped point chip/fsm/next_state[2]/q chip_fsm_next_state_reg[2]/Q -type DFF DFF
add mapped point chip/backlight/light/q chip_backlight_light_reg/Q -type DFF DFF
add mapped point chip/backlight/current_count[0]/q chip_backlight_current_count_reg[0]/Q -type DFF DFF
add mapped point chip/backlight/current_count[1]/q chip_backlight_current_count_reg[1]/Q -type DFF DFF
add mapped point chip/backlight/current_count[2]/q chip_backlight_current_count_reg[2]/Q -type DFF DFF
add mapped point chip/backlight/light_mode/q chip_backlight_light_mode_reg/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/clk_seconds/q chip_backlight_seconds_clk_clk_seconds_reg/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[0]/q chip_backlight_seconds_clk_count_reg[0]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[1]/q chip_backlight_seconds_clk_count_reg[1]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[2]/q chip_backlight_seconds_clk_count_reg[2]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[3]/q chip_backlight_seconds_clk_count_reg[3]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[4]/q chip_backlight_seconds_clk_count_reg[4]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[5]/q chip_backlight_seconds_clk_count_reg[5]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[6]/q chip_backlight_seconds_clk_count_reg[6]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[7]/q chip_backlight_seconds_clk_count_reg[7]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[8]/q chip_backlight_seconds_clk_count_reg[8]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[9]/q chip_backlight_seconds_clk_count_reg[9]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[10]/q chip_backlight_seconds_clk_count_reg[10]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[11]/q chip_backlight_seconds_clk_count_reg[11]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[12]/q chip_backlight_seconds_clk_count_reg[12]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[13]/q chip_backlight_seconds_clk_count_reg[13]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[14]/q chip_backlight_seconds_clk_count_reg[14]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[15]/q chip_backlight_seconds_clk_count_reg[15]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[16]/q chip_backlight_seconds_clk_count_reg[16]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[17]/q chip_backlight_seconds_clk_count_reg[17]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[18]/q chip_backlight_seconds_clk_count_reg[18]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[19]/q chip_backlight_seconds_clk_count_reg[19]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[20]/q chip_backlight_seconds_clk_count_reg[20]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[21]/q chip_backlight_seconds_clk_count_reg[21]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[22]/q chip_backlight_seconds_clk_count_reg[22]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[23]/q chip_backlight_seconds_clk_count_reg[23]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[24]/q chip_backlight_seconds_clk_count_reg[24]/Q -type DFF DFF
add mapped point chip/backlight/seconds_clk/count[25]/q chip_backlight_seconds_clk_count_reg[25]/Q -type DFF DFF
add mapped point chip/backlight/start_counter/q chip_backlight_start_counter_reg/Q -type DFF DFF
add mapped point chip/cd/clk_seconds/q chip_cd_clk_seconds_reg/Q -type DFF DFF
add mapped point chip/cd/count[0]/q chip_cd_count_reg[0]/Q -type DFF DFF
add mapped point chip/cd/count[1]/q chip_cd_count_reg[1]/Q -type DFF DFF
add mapped point chip/cd/count[2]/q chip_cd_count_reg[2]/Q -type DFF DFF
add mapped point chip/cd/count[3]/q chip_cd_count_reg[3]/Q -type DFF DFF
add mapped point chip/cd/count[4]/q chip_cd_count_reg[4]/Q -type DFF DFF
add mapped point chip/cd/count[5]/q chip_cd_count_reg[5]/Q -type DFF DFF
add mapped point chip/cd/count[6]/q chip_cd_count_reg[6]/Q -type DFF DFF
add mapped point chip/cd/count[7]/q chip_cd_count_reg[7]/Q -type DFF DFF
add mapped point chip/cd/count[8]/q chip_cd_count_reg[8]/Q -type DFF DFF
add mapped point chip/cd/count[9]/q chip_cd_count_reg[9]/Q -type DFF DFF
add mapped point chip/cd/count[10]/q chip_cd_count_reg[10]/Q -type DFF DFF
add mapped point chip/cd/count[11]/q chip_cd_count_reg[11]/Q -type DFF DFF
add mapped point chip/cd/count[12]/q chip_cd_count_reg[12]/Q -type DFF DFF
add mapped point chip/cd/count[13]/q chip_cd_count_reg[13]/Q -type DFF DFF
add mapped point chip/cd/count[14]/q chip_cd_count_reg[14]/Q -type DFF DFF
add mapped point chip/cd/count[15]/q chip_cd_count_reg[15]/Q -type DFF DFF
add mapped point chip/cd/count[16]/q chip_cd_count_reg[16]/Q -type DFF DFF
add mapped point chip/cd/count[17]/q chip_cd_count_reg[17]/Q -type DFF DFF
add mapped point chip/cd/count[18]/q chip_cd_count_reg[18]/Q -type DFF DFF
add mapped point chip/cd/count[19]/q chip_cd_count_reg[19]/Q -type DFF DFF
add mapped point chip/cd/count[20]/q chip_cd_count_reg[20]/Q -type DFF DFF
add mapped point chip/cd/count[21]/q chip_cd_count_reg[21]/Q -type DFF DFF
add mapped point chip/cd/count[22]/q chip_cd_count_reg[22]/Q -type DFF DFF
add mapped point chip/cd/count[23]/q chip_cd_count_reg[23]/Q -type DFF DFF
add mapped point chip/cd/count[24]/q chip_cd_count_reg[24]/Q -type DFF DFF
add mapped point chip/cd/count[25]/q chip_cd_count_reg[25]/Q -type DFF DFF
add mapped point chip/displayer/display_h1[0]/q chip_displayer_display_h1_reg[0]/Q -type DFF DFF
add mapped point chip/displayer/display_m1[0]/q chip_displayer_display_m1_reg[0]/Q -type DFF DFF
add mapped point chip/displayer/display_s1[0]/q chip_displayer_display_s1_reg[0]/Q -type DFF DFF
add mapped point chip/displayer/enable_7seg/q chip_displayer_enable_7seg_reg/Q -type DFF DFF
add mapped point chip/displayer/last_seconds_clk/q chip_displayer_last_seconds_clk_reg/Q -type DFF DFF
add mapped point chip/fsm/state[0]/q chip_fsm_state_reg[0]/Q -type DFF DFF
add mapped point chip/fsm/state[1]/q chip_fsm_state_reg[1]/Q -type DFF DFF
add mapped point chip/fsm/state[2]/q chip_fsm_state_reg[2]/Q -type DFF DFF
add mapped point chip/fsm/swFF/Q/q chip_fsm_swFF_Q_reg/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
