# Add rule to rsyslog config
echo 'local6.* /var/log/commands.log' >> /etc/rsyslog.conf

# Restart rsyslog 
systemctl restart rsyslog

# Log commands to rsyslog 
export PROMPT_COMMAND='logger -p local6.debug "$(date +"%Y-%m-%d %H:%M:%S") $(history 1 | sed "s/^[ ]*[0-9]*//") [$?]"

# Add rule to rsyslog config
echo 'local6.* /var/log/commands.log' >> /etc/rsyslog.conf

# Restart rsyslog
systemctl restart rsyslog

# Create a logrotate configuration for commands.log
echo '/var/log/commands.log {
    rotate 7
    daily
    missingok
    notifempty
    delaycompress
    compress
    postrotate
        systemctl restart rsyslog
    endscript
}' > /etc/logrotate.d/commands-log

# Logrotate for the first time
logrotate -f /etc/logrotate.d/commands-log

# Log commands to rsyslog
export PROMPT_COMMAND='logger -p local6.debug "$(date +"%Y-%m-%d %H:%M:%S") $(history 1 | sed "s/^[ ]*[0-9]*//") [$?]"'


# Create a new Logwatch configuration file for commands.log
echo '*ApplyStdDate
/var/log/commands.log' > /etc/logwatch/conf/commands.conf

# Include the custom configuration file in the main Logwatch configuration
echo 'include = commands.conf' >> /etc/logwatch/conf/logwatch.conf

echo "Logwatch configuration for commands.log added."

# Run Logwatch to generate reports
sudo logwatch

echo "Logwatch report generated."

echo "SSH Commands Logging Implementation Complete."
