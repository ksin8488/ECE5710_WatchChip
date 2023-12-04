
//input ports
add mapped point clk clk -type PI PI
add mapped point rst rst -type PI PI
add mapped point btn_mode btn_mode -type PI PI
add mapped point btn_set btn_set -type PI PI
add mapped point btn_inc btn_inc -type PI PI
add mapped point btn_dec btn_dec -type PI PI
add mapped point btn_light btn_light -type PI PI

//output ports
add mapped point h1[6] h1[6] -type PO PO
add mapped point h1[5] h1[5] -type PO PO
add mapped point h1[4] h1[4] -type PO PO
add mapped point h1[3] h1[3] -type PO PO
add mapped point h1[2] h1[2] -type PO PO
add mapped point h1[1] h1[1] -type PO PO
add mapped point h1[0] h1[0] -type PO PO
add mapped point h0[6] h0[6] -type PO PO
add mapped point h0[5] h0[5] -type PO PO
add mapped point h0[4] h0[4] -type PO PO
add mapped point h0[3] h0[3] -type PO PO
add mapped point h0[2] h0[2] -type PO PO
add mapped point h0[1] h0[1] -type PO PO
add mapped point h0[0] h0[0] -type PO PO
add mapped point m1[6] m1[6] -type PO PO
add mapped point m1[5] m1[5] -type PO PO
add mapped point m1[4] m1[4] -type PO PO
add mapped point m1[3] m1[3] -type PO PO
add mapped point m1[2] m1[2] -type PO PO
add mapped point m1[1] m1[1] -type PO PO
add mapped point m1[0] m1[0] -type PO PO
add mapped point m0[6] m0[6] -type PO PO
add mapped point m0[5] m0[5] -type PO PO
add mapped point m0[4] m0[4] -type PO PO
add mapped point m0[3] m0[3] -type PO PO
add mapped point m0[2] m0[2] -type PO PO
add mapped point m0[1] m0[1] -type PO PO
add mapped point m0[0] m0[0] -type PO PO
add mapped point s1[6] s1[6] -type PO PO
add mapped point s1[5] s1[5] -type PO PO
add mapped point s1[4] s1[4] -type PO PO
add mapped point s1[3] s1[3] -type PO PO
add mapped point s1[2] s1[2] -type PO PO
add mapped point s1[1] s1[1] -type PO PO
add mapped point s1[0] s1[0] -type PO PO
add mapped point s0[6] s0[6] -type PO PO
add mapped point s0[5] s0[5] -type PO PO
add mapped point s0[4] s0[4] -type PO PO
add mapped point s0[3] s0[3] -type PO PO
add mapped point s0[2] s0[2] -type PO PO
add mapped point s0[1] s0[1] -type PO PO
add mapped point s0[0] s0[0] -type PO PO
add mapped point colon colon -type PO PO
add mapped point light light -type PO PO

//inout ports




//Sequential Pins
add mapped point fsm/next_state[0]/q fsm_next_state_reg[0]/Q -type DFF DFF
add mapped point fsm/next_state[1]/q fsm_next_state_reg[1]/Q -type DFF DFF
add mapped point fsm/next_state[2]/q fsm_next_state_reg[2]/Q -type DFF DFF
add mapped point backlight/light/q backlight_light_reg/Q -type DFF DFF
add mapped point backlight/light_mode/q backlight_light_mode_reg/Q -type DFF DFF
add mapped point cd/clk_seconds/q cd_clk_seconds_reg/Q -type DFF DFF
add mapped point cd/count[0]/q cd_count_reg[0]/Q -type DFF DFF
add mapped point cd/count[1]/q cd_count_reg[1]/Q -type DFF DFF
add mapped point cd/count[2]/q cd_count_reg[2]/Q -type DFF DFF
add mapped point cd/count[3]/q cd_count_reg[3]/Q -type DFF DFF
add mapped point cd/count[4]/q cd_count_reg[4]/Q -type DFF DFF
add mapped point cd/count[5]/q cd_count_reg[5]/Q -type DFF DFF
add mapped point cd/count[6]/q cd_count_reg[6]/Q -type DFF DFF
add mapped point cd/count[7]/q cd_count_reg[7]/Q -type DFF DFF
add mapped point cd/count[8]/q cd_count_reg[8]/Q -type DFF DFF
add mapped point cd/count[9]/q cd_count_reg[9]/Q -type DFF DFF
add mapped point cd/count[10]/q cd_count_reg[10]/Q -type DFF DFF
add mapped point cd/count[11]/q cd_count_reg[11]/Q -type DFF DFF
add mapped point cd/count[12]/q cd_count_reg[12]/Q -type DFF DFF
add mapped point cd/count[13]/q cd_count_reg[13]/Q -type DFF DFF
add mapped point cd/count[14]/q cd_count_reg[14]/Q -type DFF DFF
add mapped point cd/count[15]/q cd_count_reg[15]/Q -type DFF DFF
add mapped point cd/count[16]/q cd_count_reg[16]/Q -type DFF DFF
add mapped point cd/count[17]/q cd_count_reg[17]/Q -type DFF DFF
add mapped point cd/count[18]/q cd_count_reg[18]/Q -type DFF DFF
add mapped point cd/count[19]/q cd_count_reg[19]/Q -type DFF DFF
add mapped point cd/count[20]/q cd_count_reg[20]/Q -type DFF DFF
add mapped point cd/count[21]/q cd_count_reg[21]/Q -type DFF DFF
add mapped point cd/count[22]/q cd_count_reg[22]/Q -type DFF DFF
add mapped point cd/count[23]/q cd_count_reg[23]/Q -type DFF DFF
add mapped point cd/count[24]/q cd_count_reg[24]/Q -type DFF DFF
add mapped point cd/count[25]/q cd_count_reg[25]/Q -type DFF DFF
add mapped point clock/hours[0]/q clock_hours_reg[0]/Q -type DFF DFF
add mapped point clock/hours[0]/q clock_hours_reg[0]47/Q -type DFF DFF
add mapped point clock/hours[0]/q clock_hours_reg[0]53/Q -type DFF DFF
add mapped point clock/hours[1]/q clock_hours_reg[1]/Q -type DFF DFF
add mapped point clock/hours[1]/q clock_hours_reg[1]48/Q -type DFF DFF
add mapped point clock/hours[1]/q clock_hours_reg[1]54/Q -type DFF DFF
add mapped point clock/hours[2]/q clock_hours_reg[2]/Q -type DFF DFF
add mapped point clock/hours[2]/q clock_hours_reg[2]49/Q -type DFF DFF
add mapped point clock/hours[2]/q clock_hours_reg[2]55/Q -type DFF DFF
add mapped point clock/hours[3]/q clock_hours_reg[3]/Q -type DFF DFF
add mapped point clock/hours[3]/q clock_hours_reg[3]50/Q -type DFF DFF
add mapped point clock/hours[3]/q clock_hours_reg[3]56/Q -type DFF DFF
add mapped point clock/hours[4]/q clock_hours_reg[4]/Q -type DFF DFF
add mapped point clock/hours[4]/q clock_hours_reg[4]51/Q -type DFF DFF
add mapped point clock/hours[4]/q clock_hours_reg[4]57/Q -type DFF DFF
add mapped point clock/hours[5]/q clock_hours_reg[5]/Q -type DFF DFF
add mapped point clock/hours[5]/q clock_hours_reg[5]52/Q -type DFF DFF
add mapped point clock/hours[5]/q clock_hours_reg[5]58/Q -type DFF DFF
add mapped point clock/minutes[0]/q clock_minutes_reg[0]/Q -type DFF DFF
add mapped point clock/minutes[0]/q clock_minutes_reg[0]35/Q -type DFF DFF
add mapped point clock/minutes[0]/q clock_minutes_reg[0]41/Q -type DFF DFF
add mapped point clock/minutes[1]/q clock_minutes_reg[1]/Q -type DFF DFF
add mapped point clock/minutes[1]/q clock_minutes_reg[1]36/Q -type DFF DFF
add mapped point clock/minutes[1]/q clock_minutes_reg[1]42/Q -type DFF DFF
add mapped point clock/minutes[2]/q clock_minutes_reg[2]/Q -type DFF DFF
add mapped point clock/minutes[2]/q clock_minutes_reg[2]37/Q -type DFF DFF
add mapped point clock/minutes[2]/q clock_minutes_reg[2]43/Q -type DFF DFF
add mapped point clock/minutes[3]/q clock_minutes_reg[3]/Q -type DFF DFF
add mapped point clock/minutes[3]/q clock_minutes_reg[3]38/Q -type DFF DFF
add mapped point clock/minutes[3]/q clock_minutes_reg[3]44/Q -type DFF DFF
add mapped point clock/minutes[4]/q clock_minutes_reg[4]/Q -type DFF DFF
add mapped point clock/minutes[4]/q clock_minutes_reg[4]39/Q -type DFF DFF
add mapped point clock/minutes[4]/q clock_minutes_reg[4]45/Q -type DFF DFF
add mapped point clock/minutes[5]/q clock_minutes_reg[5]/Q -type DFF DFF
add mapped point clock/minutes[5]/q clock_minutes_reg[5]40/Q -type DFF DFF
add mapped point clock/minutes[5]/q clock_minutes_reg[5]46/Q -type DFF DFF
add mapped point clock/old_clk_1sec/q clock_old_clk_1sec_reg/Q -type DFF DFF
add mapped point clock/seconds[0]/q clock_seconds_reg[0]/Q -type DFF DFF
add mapped point clock/seconds[1]/q clock_seconds_reg[1]/Q -type DFF DFF
add mapped point clock/seconds[2]/q clock_seconds_reg[2]/Q -type DFF DFF
add mapped point clock/seconds[3]/q clock_seconds_reg[3]/Q -type DFF DFF
add mapped point clock/seconds[4]/q clock_seconds_reg[4]/Q -type DFF DFF
add mapped point clock/seconds[5]/q clock_seconds_reg[5]/Q -type DFF DFF
add mapped point displayer/display_h1[0]/q displayer_display_h1_reg[0]/Q -type DFF DFF
add mapped point displayer/display_h1[1]/q displayer_display_h1_reg[1]/Q -type DFF DFF
add mapped point displayer/display_h1[2]/q displayer_display_h1_reg[2]/Q -type DFF DFF
add mapped point displayer/display_h1[3]/q displayer_display_h1_reg[3]/Q -type DFF DFF
add mapped point displayer/display_h1[4]/q displayer_display_h1_reg[4]/Q -type DFF DFF
add mapped point displayer/display_h1[5]/q displayer_display_h1_reg[5]/Q -type DFF DFF
add mapped point displayer/display_h1[6]/q displayer_display_h1_reg[6]/Q -type DFF DFF
add mapped point displayer/display_h2[0]/q displayer_display_h2_reg[0]/Q -type DFF DFF
add mapped point displayer/display_h2[1]/q displayer_display_h2_reg[1]/Q -type DFF DFF
add mapped point displayer/display_h2[2]/q displayer_display_h2_reg[2]/Q -type DFF DFF
add mapped point displayer/display_h2[3]/q displayer_display_h2_reg[3]/Q -type DFF DFF
add mapped point displayer/display_h2[4]/q displayer_display_h2_reg[4]/Q -type DFF DFF
add mapped point displayer/display_h2[5]/q displayer_display_h2_reg[5]/Q -type DFF DFF
add mapped point displayer/display_m1[0]/q displayer_display_m1_reg[0]/Q -type DFF DFF
add mapped point displayer/display_m1[1]/q displayer_display_m1_reg[1]/Q -type DFF DFF
add mapped point displayer/display_m1[2]/q displayer_display_m1_reg[2]/Q -type DFF DFF
add mapped point displayer/display_m1[3]/q displayer_display_m1_reg[3]/Q -type DFF DFF
add mapped point displayer/display_m1[4]/q displayer_display_m1_reg[4]/Q -type DFF DFF
add mapped point displayer/display_m1[5]/q displayer_display_m1_reg[5]/Q -type DFF DFF
add mapped point displayer/display_m1[6]/q displayer_display_m1_reg[6]/Q -type DFF DFF
add mapped point displayer/display_m2[0]/q displayer_display_m2_reg[0]/Q -type DFF DFF
add mapped point displayer/display_m2[1]/q displayer_display_m2_reg[1]/Q -type DFF DFF
add mapped point displayer/display_m2[2]/q displayer_display_m2_reg[2]/Q -type DFF DFF
add mapped point displayer/display_m2[3]/q displayer_display_m2_reg[3]/Q -type DFF DFF
add mapped point displayer/display_m2[4]/q displayer_display_m2_reg[4]/Q -type DFF DFF
add mapped point displayer/display_m2[5]/q displayer_display_m2_reg[5]/Q -type DFF DFF
add mapped point displayer/display_s1[0]/q displayer_display_s1_reg[0]/Q -type DFF DFF
add mapped point displayer/display_s1[1]/q displayer_display_s1_reg[1]/Q -type DFF DFF
add mapped point displayer/display_s1[2]/q displayer_display_s1_reg[2]/Q -type DFF DFF
add mapped point displayer/display_s1[3]/q displayer_display_s1_reg[3]/Q -type DFF DFF
add mapped point displayer/display_s1[4]/q displayer_display_s1_reg[4]/Q -type DFF DFF
add mapped point displayer/display_s1[5]/q displayer_display_s1_reg[5]/Q -type DFF DFF
add mapped point displayer/display_s1[6]/q displayer_display_s1_reg[6]/Q -type DFF DFF
add mapped point displayer/enable_7seg/q displayer_enable_7seg_reg/Q -type DFF DFF
add mapped point displayer/last_seconds_clk/q displayer_last_seconds_clk_reg/Q -type DFF DFF
add mapped point fsm/state[0]/q fsm_state_reg[0]/Q -type DFF DFF
add mapped point fsm/state[1]/q fsm_state_reg[1]/Q -type DFF DFF
add mapped point fsm/state[2]/q fsm_state_reg[2]/Q -type DFF DFF
add mapped point fsm/swFF/Q/q fsm_swFF_Q_reg/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
