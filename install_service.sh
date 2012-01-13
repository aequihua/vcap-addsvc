SVC_NAME=memcached
SRC_DIR_VCAP=$HOME/cloudfoundry/source/vcap
SRC_DIR_SVCS=$HOME/cloudfoundry/source/vcap-services
PROD_DIR=$HOME/cloudfoundry/vcap

echo "Downloading changes from GitHub"

cd $SRC_DIR_SVCS
git pull > nul
cd $SRC_DIR_VCAP
git pull > nul

if [ -f $PROD_DIR/services/$SVC_NAME/* ]
then
   rm $PROD_DIR/services/$SVC_NAME/* -R -v -f
   echo "Deleting the $SVC_NAME files"
fi

if [ -d $PROD_DIR/services/$SVC_NAME ]
then
   echo "Not recreating the $SVC_NAME directory"
else
   rmdir $PROD_DIR/services/$SVC_NAME
   echo "Deleted the $SVC_NAME directory"
   mkdir $PROD_DIR/services/$SVC_NAME
   echo "Created directory $SVC_NAME"
fi

echo "Copying changes into Production..."
cp $SRC_DIR_SVCS/$SVC_NAME/* $PROD_DIR/services/$SVC_NAME -R
cp $SRC_DIR_VCAP/bin/services/$SVC_NAME* $PROD_DIR/bin/services -R
cp $SRC_DIR_VCAP/bin/vcap $PROD_DIR/bin
cp $SRC_DIR_VCAP/cloud_controller/config/cloud_controller.yml $PROD_DIR/cloud_controller/config
cp $SRC_DIR_SVCS/base/lib/base/node_bin.rb $PROD_DIR/services/base/lib/base
exit 0
