#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�ҙg.s �Xmo�V��_qgm&5��B�4���IL�Rd���"���@�1)�	mHYi�J�t}��H��i������'�}��qBa˗���y�9��9�����5I>|�ד,$đ�;拲yg�|�@ʫ�Ǝ�d���Veޚ|@~_�P�0�&��g�q������5k$�C�@JU�n��Q�``�U�+Jsk���?�;\� "���f���kn�"csz�|�d>ݶk���:A*w��{�F�#zR��e1�e��(�9���R>�%������#�Xĺ�I�!)2,�K4L��b�O�c�=�b`!t[g��a���
 ��7aK.�����1����������5#Ϋj >���	��4��tS2��E_�,���ti�>�,:����r�)ȷE�i�:�d��e9���(�a�@}�j����C��..���-�^�꺹�3疨 ��i�L.�.���+��e�z2g�A���3��<,V@V�\���f���H�X��r�l��p�5�]���@�D$�C����,�:�p ُ�Ii^��_�����%pĜ�Zet��%Y��,r���r�&j����)���\�+Q���Ja7^��?��@��ڶ�%��SK⑔4���s>�eAq��4S��F������_/�^r��>=U5I6���t����@�>"!ZV5>UA~����tQ�/O{Y��/�����wF|�1$cg =�ً��@3r[�^����=�Q����#F˝�s10q�/c�E�EC5�}�G��,9��wws��O�
D��`���5=�{(�h�f�`N�p��A�>�û+��yGwR�_xww���hZ���B��	���o��!:0٥2)N���l7����?�ؔ�r&Њ��)�^�ӐsMa�	L
G��.cW���y1NJ�,�h�,j�$Z��s�1�c���w���my["�Ӑ[R[f'�&�<n�U%���μ9Ze'ۀ��Hy�<ϱ��<��ck�l�0-���6��KWHc�����fn�Ŝ�|t?]�p�$��W~���0�z�DC��󭞣��or*x�Io�YЍ(����X�y�n^�5��o»G�a^D�;��&-���1:HW�p�9�������)*Ҕ|������8عSThhȣ:ڃ�ZFJ���X�a���S��(�2d9��S��Ѳ��{p�ñ� �E,�0{�>}�\'�\26`�6�2D���ɠ�4,(��L��`�N�l(��J�5��Y�5<���-��.�Ś;����RB�S1�а�0�ʐ2�Q�x;˂֤s��/L���>n����rJ����F�׽�b��1o_l�PUaG�Ur����h劣M�Z'��s+BxD2X�m���K�}ƹ��͙5�Ǹm�u^h�ۯ�GU�����#�5���.Dn%�F���CHT\��c:��>>\DTd����͹�?�s��8v�^5  