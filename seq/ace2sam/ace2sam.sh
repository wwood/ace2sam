#!/bin/bash
INPUT=
SAM=
FASTA=
while getopts ":i:hf:s:" opt; do
    case $opt in
        i)
           INPUT=$OPTARG
            ;;
        f)
            FASTA=$OPTARG
            ;;
        s)
            SAM=$OPTARG
            ;;
        h)
            echo "ace2sam.sh -i in.ace -f out.fa -s out.sam"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done
./ace2sam $INPUT >a2s.out 2>a2s.err && (grep ^H a2s.err | sed s,^..,,; cat a2s.out) > $SAM && grep ^S a2s.err | sed s,^..,, > $FASTA && rm a2s.out a2s.err
