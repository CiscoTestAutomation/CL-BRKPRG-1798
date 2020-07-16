# Take first snapshot

mkdir 06_08_19
robot -d 06_08_19 --variable snapshot:./06_08_19/snapshot --variable devices:"nx-osv-1;csr1000v-1" --variable features:"ospf;config" snapshots.robot

# The next day, retake a snapshot

mkdir 06_08_20
robot -d 06_08_20 --variable snapshot:./06_08_20/snapshot --variable devices:"nx-osv-1;csr1000v-1" --variable features:"ospf;config" snapshots.robot

# Then compare them

robot -d diff_19_20 --variable snapshot1:./06_08_19/snapshot --variable snapshot2:./06_08_20/snapshot --variable devices:"nx-osv-1;csr1000v-1" compare.robot
