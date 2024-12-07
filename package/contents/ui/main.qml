import QtQuick 
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid
import org.kde.kquickcontrolsaddons
import QtQuick.Controls
import org.kde.plasma.components as PlasmaComponents3

PlasmoidItem {
    id: root
    height:Screen.height * 0.23 ; width: Screen.width * 0.12
    Plasmoid.icon: {
        let iconName = "plasma-symbolic";
        return iconName;
    }
    fullRepresentation: FullRepresentation {
    }
    compactRepresentation: CompactRepresentation {
    }


}
