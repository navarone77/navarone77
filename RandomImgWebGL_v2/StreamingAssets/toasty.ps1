[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime]

# Toast XML
$ToastXmlString = @"
<toast>
    <visual>
        <binding template="ToastGeneric">
            <text>Toast Notification</text>
            <text>This is a native PowerShell toast notification.</text>
        </binding>
    </visual>
</toast>
"@

# Convert string to XML Document
$XmlDoc = New-Object Windows.Data.Xml.Dom.XmlDocument
$XmlDoc.LoadXml($ToastXmlString)

# Toast Notification
$Toast = [Windows.UI.Notifications.ToastNotification]::new($XmlDoc)

# Get the ToastNotifier
$Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("YourAppName")

# Show the notification
$Notifier.Show($Toast)
