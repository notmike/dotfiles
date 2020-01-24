/*  -*-  eval: (turn-on-orgtbl); -*-
 * notmike's HHKB Layout heavily based off of cinaeco's work
 * https://github.com/qmk/qmk_firmware/tree/master/keyboards/hhkb/keymaps/cinaeco
 */

#include QMK_KEYBOARD_H

// Layers.
#define QWER 0
#define GAME 1
#define HHKB 2
#define UTIL 3
#define MREC 4

// Easier-to-read Layer Arrays.
#define ____ KC_TRNS

enum hhkb_keycodes
{
    DYNAMIC_MACRO_RANGE = SAFE_RANGE,
};

#include "dynamic_macro.h"

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    /* QWER Layer: Qwerty Default
     *
     * ,--------------------------------------------------------------.
     * |Esc|    1 |  2|  3|  4|  5|  6|  7|  8|  9|  0|  -|  =|  \|  `|
     * |--------------------------------------------------------------|
     * |Tab  |Q/MREC|  W|  E|  R|  T|  Y|  U|  I|  O|  P|  [|  ]|Backs|
     * |--------------------------------------------------------------|
     * |Ctrl  |     A|  S|  D|  F|  G|  H|  J|  K|  L|  ;|  '| Enter  |
     * |--------------------------------------------------------------|
     * |Shft/( |     Z|  X|  C|  V|  B|  N|  M|  ,|  .|  /|Shft/) |Fn0|
     * `--------------------------------------------------------------'
     *       |Alt|Gui  |       Space/UTIL      |Gui  |Alt|
     *       `-------------------------------------------'
     *
     */

  [QWER] = LAYOUT(
  KC_ESC,  KC_1,           KC_2,    KC_3,             KC_4,    KC_5,     KC_6, KC_7, KC_8,    KC_9,   KC_0,    KC_MINS, KC_EQL,        KC_BSLS, KC_GRV, \
  KC_TAB,  LT(MREC, KC_Q), KC_W,    KC_E,             KC_R,    KC_T,     KC_Y, KC_U, KC_I,    KC_O,   KC_P,    KC_LBRC, KC_RBRC,       KC_BSPC,         \
  KC_LCTL, KC_A,           KC_S,    KC_D,             KC_F,    KC_G,     KC_H, KC_J, KC_K,    KC_L,   KC_SCLN, KC_QUOT, KC_ENT,                  \
  KC_LSPO, KC_Z,           KC_X,    KC_C,             KC_V,    KC_B,     KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_RSPC, MO(HHKB),                       \
           KC_LALT,        KC_LGUI, LT(UTIL, KC_SPC), KC_RGUI, KC_RALT),


    /* GAME Layer: Basic Ass Keyboard, no mods
     *
     * ,--------------------------------------------------------------.
     * |Esc|    1 |  2|  3|  4|  5|  6|  7|  8|  9|  0|  -|  =|  \|  `|
     * |--------------------------------------------------------------|
     * |Tab  |  Q|  W|  E|  R|  T|  Y|  U|  I|  O|  P|  [ | ] |Backs  |
     * |--------------------------------------------------------------|
     * |Ctrl  |     A|  S|  D|  F|  G|  H|  J|  K|  L|  ;|  '|  Enter |
     * |--------------------------------------------------------------|
     * |Shft   |     Z|  X|  C|  V|  B|  N|  M|  ,|  .|  /| Shft  |Fn0|
     * `--------------------------------------------------------------'
     *       |Alt|Gui  |       Space           |Gui  |Alt|
     *       `-------------------------------------------'
     *
     */

  [GAME] = LAYOUT(
  KC_ESC,  KC_1,    KC_2,    KC_3,   KC_4,    KC_5,     KC_6, KC_7, KC_8,    KC_9,   KC_0,    KC_MINS, KC_EQL,   KC_BSLS, KC_GRV, \
  KC_TAB,  KC_Q,    KC_W,    KC_E,   KC_R,    KC_T,     KC_Y, KC_U, KC_I,    KC_O,   KC_P,    KC_LBRC, KC_RBRC,  KC_BSPC,         \
  KC_LCTL, KC_A,    KC_S,    KC_D,   KC_F,    KC_G,     KC_H, KC_J, KC_K,    KC_L,   KC_SCLN, KC_QUOT, KC_ENT,                    \
  KC_LSFT, KC_Z,    KC_X,    KC_C,   KC_V,    KC_B,     KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_RSFT, MO(HHKB),                  \
           KC_LALT, KC_LGUI, KC_SPC, KC_RGUI, KC_RALT),

    /* HHKB Layer: HHKB mode (HHKB Fn)
     *
     * ,-----------------------------------------------------------.
     * |QWE| F1| F2| F3| F4| F5| F6| F7| F8| F9|F10|F11|F12|Ins|Del|
     * |-----------------------------------------------------------|
     * |Caps |WBk|WHm|WFw|WRf|WSt|   |   |Psc|Slk|Pus|Up |PgU| Home|
     * |-----------------------------------------------------------|
     * |      |VoD|VoU|Mut|Ejc|   |  *|  /|Hom|PgU|Lef|Rig|Enter   |
     * |-----------------------------------------------------------|
     * |        |PRV|NXT|PLA|   |   |  +|  -|End|PgD|Dow|      |   |
     * `-----------------------------------------------------------'
     *       |   |     |                       |STOP |PgD |
     *       `-------------------------------------------'
     */

  [HHKB] = LAYOUT(
  TO(QWER), KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5, KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  KC_INS,  KC_DEL, \
  KC_CAPS,  KC_WBAK, KC_WHOM, KC_WFWD, KC_WREF, KC_WSTP,  ____,    ____,    KC_PSCR, KC_SLCK, KC_PAUS, KC_UP,   KC_PGUP,  KC_HOME,     \
  ____,     KC_VOLD, KC_VOLU, KC_MUTE, KC_EJCT, ____,  KC_PAST, KC_PSLS, KC_HOME, KC_PGUP, KC_LEFT, KC_RGHT, KC_PENT,                  \
  ____,     KC_MPRV, KC_MNXT, KC_MPLY, ____,    ____,  KC_PPLS, KC_PMNS, KC_END,  KC_PGDN, KC_DOWN, ____,    ____,                     \
            ____,    ____,    ____,    KC_MSTP, KC_PGDN),


    /* UTIL Layer: Extra utilities
     *
     * ,-------------------------------------------------------------.
     * |DFU|PLY1|PLY2|   |   |   |   |   |   |   |   |QWE|GME|UTL|DBG|
     * |-------------------------------------------------------------|
     * |     |    |MLB|M-Up|MRB|MwU|Hom|PgD|PgU|End|Psc|   |   |     |
     * |-------------------------------------------------------------|
     * |      |   |M-Lt|M-Dn|M-R|MwD|LEF|DOW|UP |RIG|   |   |        |
     * |-------------------------------------------------------------|
     * |        |    |    |   |   |SPC|   |   |   |   |   |      |   |
     * `-------------------------------------------------------------'
     *       |   |     |                       |     |   |
     *       `-------------------------------------------'
     *
     */

  [UTIL] = LAYOUT(
  RESET, DYN_MACRO_PLAY1, DYN_MACRO_PLAY2, ____,    ____,    ____,   ____,    ____,    ____,    ____,    ____, ____, TO(GAME), DF(UTIL), DEBUG, \
  ____,  ____,  KC_BTN1,  KC_MS_U,  KC_BTN2, KC_WH_U, KC_HOME, KC_PGDN, KC_PGUP, KC_END, KC_PSCR, ____,     ____,     KC_DEL,        \
  ____,  ____,  KC_MS_L,  KC_MS_D,  KC_MS_R, KC_WH_D, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, ____, ____,     ____,                  \
  ____,  ____,   ____,    ____,    ____,    KC_SPC, ____,    ____,    ____,    ____,    ____, ____,     ____,                  \
         ____,   ____,    ____,    ____,    ____),


    /* MREC Layer: Record macros by holding down `q` and tapping '1' or '2'
     *		   Stop Recording macros by holding down 'q' and tapping 's'
     *
     * ,-------------------------------------------------------------.
     * |   |REC1|REC2|   |   |   |   |   |   |   |   |   |   |   |   |
     * |-------------------------------------------------------------|
     * |     |    |    |   |   |   |   |   |   |   |   |   |   |     |
     * |-------------------------------------------------------------|
     * |      |    |RSTP|   |   |   |   |   |   |   |   |   |        |
     * |-------------------------------------------------------------|
     * |        |    |    |   |   |   |   |   |   |   |   |      |   |
     * `-------------------------------------------------------------'
     *       |   |     |                       |     |   |
     *       `-------------------------------------------'
     *
     */

  [MREC] = LAYOUT(
  ____, DYN_REC_START1, DYN_REC_START2, ____, ____, ____, ____, ____, ____, ____, ____, ____, ____, ____, ____, \
  ____, ____,           ____,           ____, ____, ____, ____, ____, ____, ____, ____, ____, ____, ____,       \
  ____, ____,           DYN_REC_STOP,   ____, ____, ____, ____, ____, ____, ____, ____, ____, ____,             \
  ____, ____,           ____,           ____, ____, ____, ____, ____, ____, ____, ____, ____, ____,             \
        ____,           ____,           ____, ____, ____)

};



const uint16_t PROGMEM fn_actions[] = {

};

const macro_t *action_get_macro(keyrecord_t *record, uint8_t id, uint8_t opt)
{
    return MACRO_NONE;
};

// For Dynamic Macros.
bool process_record_user(uint16_t keycode, keyrecord_t *record)
{
    if (!process_record_dynamic_macro(keycode, record))
    {
        return false;
    }
    return true;
}
