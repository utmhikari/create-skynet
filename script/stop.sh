ps aux | grep -ie skynet | awk '{print $2}' | xargs kill -9 
