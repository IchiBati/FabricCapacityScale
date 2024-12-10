# Azure Fabric Scaling Automation

Dieses Repository enthält ein PowerShell-Skript, das zur Skalierung (Starten und Stoppen) von Azure Fabric Capacity Ressourcen verwendet wird. Es wurde entwickelt, um als **Azure Automation Runbook** zu fungieren, das mit einer **Managed Identity** arbeitet, um Azure Fabric-Kapazitäten automatisch zu steuern.

## Voraussetzungen

Um dieses Skript erfolgreich in einer Azure Automation-Umgebung auszuführen, sind die folgenden Voraussetzungen erforderlich:

### 1. Azure Automation Account
Ein **Azure Automation-Konto** muss existieren, um das Skript als Runbook auszuführen. Dieses Konto sollte mit einer **Managed Identity** ausgestattet sein, die mit den erforderlichen Berechtigungen in der Ziel-Subscription verknüpft ist.

### 2. Berechtigungen für das Automation-Konto
Das **Automation-Konto** muss mit der entsprechenden **Managed Identity** die Rolle "Contributor" (oder eine geeignete Rolle) für die Ressourcen der Azure Fabric zugewiesen bekommen. Dies ermöglicht das Starten und Stoppen der Fabric Capacity.

### 3. Azure PowerShell Module
Das Skript verwendet Cmdlets aus dem **Azure PowerShell Modul**. Um diese in einem Azure Automation Runbook auszuführen, müssen die folgenden Module installiert und verfügbar sein:

- **Az.Accounts**: Ermöglicht die Anmeldung und Verwaltung der Azure-Konten.
- **Az.Resources**: Ermöglicht das Arbeiten mit Azure-Ressourcen und deren Verwaltung, einschließlich der Ressourcen, die für das Azure Fabric benötigt werden.
- **Az.Fabric**: Bietet Cmdlets zum Verwalten und Skalieren von Azure Fabrics.

#### Hinweise:
- Alle diese Module sind Teil des **Az-Modulpakets**, das regelmäßig aktualisiert wird. Stellen Sie sicher, dass Ihre Automation-Umgebung auf die neueste Version dieser Module aktualisiert ist, um Kompatibilitätsprobleme zu vermeiden.

### 4. Managed Identity
Für das Runbook ist eine **Managed Identity** erforderlich, die das Skript mit Azure authentifiziert. Diese Identität sollte über die entsprechenden Berechtigungen (z. B. "Contributor" für die Azure Fabric Capacity) verfügen.

### 5. Rollenzuweisung der Managed Identity
Stellen Sie sicher, dass die **Managed Identity** des Automation-Kontos in der Azure Subscription, in der sich die Azure Fabric Capacity befindet, eine passende Rolle zugewiesen bekommt. Dies ermöglicht die Verwaltung der Azure Fabric Capacity durch das Runbook.

### 6. Parameter
Das Skript akzeptiert die folgenden Parameter:

- **$capacityMode**: Die gewünschte Aktion (`start`, `stop` oder ein spezifischer SKU-Wert) zur Verwaltung der Azure Fabric Capacity. Neben den Aktionen "start" und "stop" kann auch ein SKU-Wert wie `F2`, `F4`, `F8`, bis hin zu `F2048` übergeben werden, um die Kapazität der Azure Fabric zu skalieren.
- **$resourceGroupName**: Der Name der Ressourcengruppe, in der sich die Azure Fabric Capacity befindet.
- **$capacityName**: Der Name der Azure Fabric Capacity, die gesteuert oder skaliert werden soll.

### 7. Azure Subscription und Resource Group
Das Skript ist so konzipiert, dass es in der aktiven Azure-Subscription arbeitet. Die Ressourcengruppe und der Name der Fabric Capacity können als Parameter übergeben werden.  
Selbstverständlich sind auch andere Azure Authentifizierungs-Methoden denkbar, dies erfordert jedoch dann die Änderung an den entsprechenden Stellen im Skript und in der Cloud.

## Verwendung

### Beispiel-Skriptaufruf:

```powershell
Set-Capacity-Mode -capacityMode "start" -resourceGroupName "MyResourceGroup" -capacityName "MyFabricCapacity"
