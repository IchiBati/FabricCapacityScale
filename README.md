# Azure Fabric Capacity Management Runbook

Dieses PowerShell-Skript ermöglicht die bequeme Verwaltung von Azure Fabric Capacities, einschließlich Start, Stopp und Skalierung auf vordefinierte Größen.

## Funktionen

- **Starten** einer Fabric Capacity.
- **Stoppen** einer Fabric Capacity.
- **Skalieren** der Kapazität auf vordefinierte Werte (z. B. F2, F4, F8, usw.).

## Voraussetzungen

### 1. Azure Automation-Konto
Das Runbook muss in einem Azure Automation-Konto ausgeführt werden.

### 2. Managed Identity
Die Managed Identity des Automation-Kontos benötigt spezifische Berechtigungen:
- **Reader**-Rolle für die Zielressourcengruppe.
- **Contributor**-Rolle für die Ziel-Fabric Capacity.
- Alternativ: Rollenbasierte Zugriffssteuerung (RBAC) direkt auf der Fabric-Ebene.

### 3. Azure PowerShell Module
Das Skript verwendet cmdlets aus dem **Azure PowerShell Modul** (z. B. `Resume-AzFabricCapacity`, `Suspend-AzFabricCapacity`), die in der Automation-Umgebung installiert sein müssen.

### 4. Ressourcen
- Fabric Capacity und Automation-Konto müssen sich im selben Azure Tenant befinden.
- Ressourcengruppe und Name der Kapazität müssen bekannt sein.

## Parameter

Das Skript akzeptiert folgende Parameter:

- **`capacityMode`** *(string)*: Der gewünschte Modus oder die neue Kapazitätsgröße.
  - Werte: `start`, `stop`, `F2`, `F4`, `F8`, `F16`, `F32`, `F64`, `F128`, `F256`, `F512`, `F1024`, `F2048`.
- **`resourceGroupName`** *(string)*: Name der Ressourcengruppe, in der sich die Fabric Capacity befindet.
- **`capacityName`** *(string)*: Name der zu steuernden Fabric Capacity.

## Nutzung

### Beispielaufruf

```powershell
.\ManageFabricCapacity.ps1 -capacityMode "start" -resourceGroupName "myResourceGroup" -capacityName "myCapacity"
