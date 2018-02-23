
# Linux
#echo "Checking physical memory size..."
#TOTAL_MEMORY=`free -b | awk '/Mem:/ { print int($2 / 1024^2) }'`
#echo "Found $TOTAL_MEMORY MB memory"

# Mac
echo "Checking physical memory size..."
TOTAL_MEMORY=`sysctl hw.memsize | awk '{ print int($2 / 1024^2) }'`
echo "Found $TOTAL_MEMORY MB memory"
