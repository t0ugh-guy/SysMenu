import QtQuick
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.plasma.plasmoid
import org.kde.plasma.extras as PlasmaExtras

PlasmaExtras.Representation{

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onClicked: {
            root.expanded = !root.expanded;
        }
    }
    Kirigami.Icon {
        id: icon
        anchors.fill: parent
        source: plasmoid.icon
    }
}
