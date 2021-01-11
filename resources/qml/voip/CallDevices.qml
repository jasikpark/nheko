import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.2
import im.nheko 1.0

Popup {
    modal: true
    anchors.centerIn: parent
    palette: colors

    ColumnLayout {
        spacing: 16

        ColumnLayout {
            spacing: 8
            Layout.topMargin: 8
            Layout.leftMargin: 8
            Layout.rightMargin: 8

            RowLayout {
                Image {
                    Layout.preferredWidth: 22
                    Layout.preferredHeight: 22
                    source: "image://colorimage/:/icons/icons/ui/microphone-unmute.png?" + colors.windowText
                }

                ComboBox {
                    id: micCombo

                    Layout.fillWidth: true
                    model: CallManager.mics
                }

            }

            RowLayout {
                visible: CallManager.isVideo && CallManager.cameras.length > 0

                Image {
                    Layout.preferredWidth: 22
                    Layout.preferredHeight: 22
                    source: "image://colorimage/:/icons/icons/ui/video-call.png?" + colors.windowText
                }

                ComboBox {
                    id: cameraCombo

                    Layout.fillWidth: true
                    model: CallManager.cameras
                }

            }

        }

        DialogButtonBox {
            Layout.leftMargin: 128
            standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
            onAccepted: {
                Settings.microphone = micCombo.currentText;
                if (cameraCombo.visible)
                    Settings.camera = cameraCombo.currentText;

                close();
            }
            onRejected: {
                close();
            }
        }

    }

    background: Rectangle {
        color: colors.window
        border.color: colors.windowText
    }

}