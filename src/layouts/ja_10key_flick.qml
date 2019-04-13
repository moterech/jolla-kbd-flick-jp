// Copyright (C) 2013 Jolla Ltd.
// Contact: Pekka Vuorela <pekka.vuorela@jollamobile.com>

import QtQuick 2.0
import Sailfish.Silica 1.0 as Silica
import "./ja_10key_flick"
import ".."

KeyboardLayout {
    type: "japan_flick_anthy"
    id: main

    property bool shiftShifted: false
    property bool textCaptState: false
    property int flickKeyWidth
    property int flickKeyHeight
    property double flickKeyMultiplier

    splitSupported: false

    flickKeyMultiplier: portraitMode == false ? 5.075 : 4.775
    /* Really temporal fix. I think there world be better solution... */

    flickKeyWidth: main.width / 5
    flickKeyHeight: main.height / flickKeyMultiplier

    height: portraitMode == false ? geometry.keyHeightLandscape * flickKeyMultiplier
                     :  geometry.keyHeightPortrait * flickKeyMultiplier
    width: portraitMode == false ? geometry.keyboardWidthLandscape
                     : geometry.keyboardWidthPortrait

    Row {
        TenKey_CustomArrowKey {
            direction: "left"
            implicitWidth: flickKeyWidth
            implicitHeight: flickKeyHeight
            separator: true
        }
        TenKey_Flick {
            flickerText: "\u3042\u3044\u3046\u3048\u304A"
            captionShifted: " "
            symView: "1@%#"
            symView2: ""
            accents: ""
            accentsShifted: ""
        }
        TenKey_Flick {
            flickerText: "\u304B\u304D\u304F\u3051\u3053"
            captionShifted: "abc"
            captionShifted2: "ABC"
            symView: "2\\|/"
            symView2: ""
            accents: ""
            accentsShifted: ""
        }
        TenKey_Flick {
            flickerText: "\u3055\u3057\u3059\u305B\u305D"
            captionShifted: "def"
            captionShifted2: "DEF"
            symView: "3+=-"
            symView2: ""
            accents: ""
            accentsShifted: ""
        }
        TenKey_CustomArrowKey {
            separator: false
            direction: "right"
            implicitWidth: flickKeyWidth
            implicitHeight: flickKeyHeight
        }
    }

    Row {
        TenKey_SymbolKey {
            caption: attributes.inSymView ? "\u304B\u306A" : "1&"
            implicitWidth: flickKeyWidth
            implicitHeight: flickKeyHeight
//            visible: SeparatorState.VisibleSeparator
            separator: true
        }
        TenKey_Flick {
            flickerText: "\u305F\u3061\u3064\u3066\u3068"
            captionShifted: "ghi"
            captionShifted2: "GHI"
            symView: "4\u30FB*&"
            symView2: ""
            accents: ""
            accentsShifted: ""
        }
        TenKey_Flick {
            flickerText: "\u306A\u306B\u306C\u306D\u306E"
            captionShifted: "jkl"
            captionShifted2: "JKL"
            symView: "5<^>"
            symView2: ""
            accents: ""
            accentsShifted: ""
        }
        TenKey_Flick {
            flickerText: "\u306F\u3072\u3075\u3078\u307B"
            captionShifted: "mno"
            captionShifted2: "MNO"
            symView: "6\uFF5E\u2026\u2192"
            symView2: ""
            accents: ""
            accentsShifted: ""
        }
        TenKey_CustomArrowKey {
            direction: "up"
            implicitWidth: flickKeyWidth / 2
            implicitHeight: flickKeyHeight
        }
        TenKey_CustomArrowKey {
            direction: "down"
            separator: false
            implicitWidth: flickKeyWidth / 2
            implicitHeight: flickKeyHeight
        }
    }

    Row {
        TenKey_ShiftKey {
            implicitWidth: flickKeyWidth
            implicitHeight: flickKeyHeight
            separator: true
//            implicitSeparator: true
        }
        TenKey_Flick {
            flickerText: "\u307E\u307F\u3080\u3081\u3082"
            captionShifted: "pqrs"
            captionShifted2: "PQRS"
            symView: "7\u00A5$\u3012"
            symView2: ""
            accents: ""
            accentsShifted: ""
        }
        TenKey_Flick {
            flickerText: "\u3084\u3084\u3086\u3084\u3088"
            captionShifted: "tuv"
            captionShifted2: "TUV"
            symView: "8\u00D7\u00F7\u203B"
            symView2: ""
            accents: ""
            accentsShifted: ""
        }
        TenKey_Flick {
            flickerText: "\u3089\u308A\u308B\u308C\u308D"
            captionShifted: "wxyz"
            captionShifted2: "WXYZ"
            symView: "9:;_"
            symView2: ""
            accents: ""
            accentsShifted: ""
        }
        BackspaceKey {
            implicitWidth: flickKeyWidth
            implicitHeight: flickKeyHeight
//            visible: SeparatorState.HiddenSeparator
//            separator: false
        }
    }

    Row {
        SpacebarKey {
//            icon.source: "image://theme/icon-s-sync"
            implicitWidth: flickKeyWidth
            implicitHeight: flickKeyHeight
            separator: SeparatorState.AutomaticSeparator
            implicitSeparator: true
            Image {
                source: "../graphic-keyboard-highlight-top.png"
                anchors.right: parent.right
                visible: (separator === SeparatorState.AutomaticSeparator && implicitSeparator)
                         || separator === SeparatorState.VisibleSeparator
            }
        }
        TenKey_Flick {
            captionShifted: "\u2191"
            flickerText: "\u309B\u309C"
            symView: "\u300C\u300D()"
            symView2: ""
            accents: ""
            accentsShifted: ""
//            enableFlicker: false
            symbolOnly: true
        }
        TenKey_Flick {
            flickerText: "\u308F\u3092\u3093\u30FC"
            captionShifted: "@;/&"
            symView: "0'\"\u00B0"
            symView2: ""
            accents: "" //
            accentsShifted: ""
        }
        TenKey_Flick {
            flickerText: "\u3001\u3002\uFF1F\uFF01"
            captionShifted: ".,-_"
            symView: ".,\u2606\u266A"
            symView2: ""
            accents: ""
            accentsShifted: ""
//            enableFlicker: false
            symbolOnly: true
        }
        EnterKey {
            implicitWidth: flickKeyWidth
            implicitHeight: flickKeyHeight
//            visible: SeparatorState.HiddenSeparator
//            separator: false
            Rectangle {
                anchors.fill: parent
                opacity: 0
            }

        }
    }

}
