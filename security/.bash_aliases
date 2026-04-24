#Kubernetes
alias show-pods='kubectl get pods -o wide -n'

function connect-pod {
  kubectl exec "$1" -it -n "$2" -- bash;
}

function copy-to-pods {
  pods=$(kubectl get pods -n $1 --no-headers -o custom-columns=":metadata.name" | grep 'main-application')
  for pod in $pods; do
    echo "Copying $2 into $pod ...";
    file_dir=$(dirname $2);
    kubectl cp $2 $1/$pod:$file_dir
  done
}

#Docker
function dexec {
   echo -ne "\033]0;Docker: $1\007"
   sudo docker exec -it $1 $2 
}
function aex {
   echo -ne "\033]0;Docker: apache\007"
   sudo docker exec -it apache /bin/bash -c 'cd /data/live && exec /bin/bash' 
}

# Git
function gc {
  git checkout $1
}

function gcb {
  git checkout -b $1
}

function gps {
  git push origin $1
}

function gpl {
  git pull origin $1
}

alias gb='git branch';
alias gs='git status';

# node
alias nd='npm run dev';
alias nb='npm run build';
alias ns='npm start';

# misc
alias cc='clear';
