import QtQuick 
import org.kde.plasma.components as PlasmaComponents3 
import org.kde.plasma.extras as PlasmaExtras
import QtQuick.Controls 
import org.kde.kirigami as Kirigami
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasma5support as Plasma5Support
import org.kde.plasma.plasmoid

PlasmaExtras.Representation {
	Plasma5Support.DataSource {
        id: bashcmd
        engine: "executable"
        connectedSources: []

        function exec(cmd) {
            bashcmd.connectSource(cmd)
        }

        onNewData: function(source, data) {
            disconnectSource(source)
        }
	}
	PlasmaComponents3.Button {
		id: logOutB
		height: parent.height*0.142; width: parent.width*0.2
  		anchors.right: parent.right;
    	icon.name: "lock"
		onClicked: bashcmd.exec('bash -c "loginctl lock-session"')
    }
	Rectangle{
		id: hi
		height: logOutB.height
		anchors.right: logOutB.left; anchors.left:parent.left
		color: PlasmaCore.Theme.backgroundColor
		PlasmaComponents3.Label {
			text:"Hi there!!"
			anchors.verticalCenter: hi.verticalCenter
		}

	}	
	PlasmaComponents3.Button {
		id: systemInfo
		anchors.top: hi.bottom; anchors.right: parent.right; anchors.left: parent.left
		height: logOutB.height
		text:"System Info."
		icon.name:"exifinfo"
		onClicked: bashcmd.exec('bash -c "kinfocenter"')
    }
	PlasmaComponents3.Button {
		id: systemSettings
		anchors.top: systemInfo.bottom; anchors.right: parent.right; anchors.left: parent.left
		height: logOutB.height
    	icon.name: "process-working-symbolic"
		text:"System Settings"
		onClicked: bashcmd.exec('bash -c "systemsettings"')
    }
	Rectangle{
		id: spacer
		anchors.top: systemSettings.bottom; anchors.right: parent.right; anchors.left: parent.left
		height: logOutB.height
		color: PlasmaCore.Theme.backgroundColor
	}
  	PlasmaComponents3.Button {
		id: sleep
		anchors.top: spacer.bottom; anchors.left: parent.left
		height: logOutB.height; width: hi.width
    	icon.name: "system-suspend"
		text:"Sleep"
		onClicked: bashcmd.exec('bash -c "systemctl suspend"')
    }
	PlasmaComponents3.Button {
		id: sleepTimer
		anchors.top: spacer.bottom; anchors.left: sleep.right
		height: logOutB.height; width: logOutB.width
    	icon.name: "smallclock"
		onClicked: {inlineInput00.visible = true
			sleepTimer.icon.name = "";
		}
		Rectangle {
			id: inlineInput00
			color: PlasmaCore.Theme.buttonBackgroundColor
			visible: false
			anchors.right: parent.right
			width: systemInfo.width; height: parent.height
			TextField {
				id: sleepTimerInput
				placeholderText: "Enter Seconds..."
				anchors.left: parent.left
				width: sleep.width
				anchors.verticalCenter: parent.verticalCenter
			}
			PlasmaComponents3.Button {
				id: sleepTimerSubmitButton
				icon.name: "keyboard-enter"
				anchors.right: parent.right
				width: sleepTimer.width
				anchors.verticalCenter: parent.verticalCenter
				highlighted: true
				onClicked: {
					bashcmd.exec('bash -c "sleep ' + sleepTimerInput.text + '; systemctl suspend"')
					inlineInput00.visible = false
					sleepTimer.icon.name = "smallclock"
				}
			}
		}

    }
	PlasmaComponents3.Button {
		id: restart
		anchors.top: sleep.bottom; anchors.left: parent.left
		height: logOutB.height; width: hi.width
    	icon.name: "system-reboot"
		text:"Restart"
    }
	PlasmaComponents3.Button {
		id: restartTimer
		anchors.top: sleepTimer.bottom; anchors.left: restart.right
		height: logOutB.height; width: logOutB.width
    	icon.name: "smallclock"
		onClicked: {
			inlineInput01.visible = true
			restartTimer.icon.name = "";
		}
		Rectangle {
			id: inlineInput01
			color: PlasmaCore.Theme.buttonBackgroundColor

			visible: false
			anchors.right: parent.right
			width: systemInfo.width; height: parent.height
			TextField {
				id: restartTimerInput
				placeholderText: "Enter Seconds..."
				anchors.left: parent.left
				width: sleep.width
				anchors.verticalCenter: parent.verticalCenter
			}
			PlasmaComponents3.Button {
				id: restartTimerSubmitButton
				icon.name: "keyboard-enter"
				anchors.right: parent.right
				width: sleepTimer.width
				anchors.verticalCenter: parent.verticalCenter
				highlighted: true
				onClicked: {
					bashcmd.exec('bash -c "sleep ' + sleepTimerInput.text + '; reboot"')
					inlineInput01.visible = false
					sleepTimer.icon.name = "smallclock"
				}
			}
		}
	}

	PlasmaComponents3.Button {
		id: powerOff
		anchors.top: restart.bottom; anchors.left: parent.left
		height: logOutB.height; width: hi.width
    	icon.name: "system-shutdown"
		text:"Power off"
    }
	PlasmaComponents3.Button {
		id: powerOffTimer
		anchors.top: restartTimer.bottom; anchors.left: powerOff.right
		height: logOutB.height; width: logOutB.width
    	icon.name: "smallclock"
		onClicked: {
			inlineInput02.visible = true
			powerOffTimer.icon.name = "";
		}
		Rectangle {
			id: inlineInput02
			color: PlasmaCore.Theme.buttonBackgroundColor
			visible: false
			anchors.right: parent.right
			width: systemInfo.width; height: parent.height
			TextField {
				id: powerOffTimerInput
				placeholderText: "Enter Seconds..."
				anchors.left: parent.left
				width: sleep.width
				anchors.verticalCenter: parent.verticalCenter
			}
			PlasmaComponents3.Button {
				id: powerOffTimerSubmitButton
				icon.name: "keyboard-enter"
				anchors.right: parent.right
				width: sleepTimer.width
				anchors.verticalCenter: parent.verticalCenter
				highlighted: true
				onClicked: {
					bashcmd.exec('bash -c "sleep ' + sleepTimerInput.text + '; shutdown now"')
					inlineInput02.visible = false
					powerOffTimer.icon.name = "smallclock"
				}
			}
		}
    }
	
}

