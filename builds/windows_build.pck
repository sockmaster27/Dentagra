GDPC                                                                               @   res://.import/enemy.png-63f114c7bb3f2105c232c34f647cbc2d.stex   @&      �      "�4}-%�A�`����<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�:      U      -��`�0��x�5�[D   res://.import/player-kopi.png-9d260e0aea970c774628962ecb557b1c.stex p+      �      K6���J�gb�e��Ԉg@   res://.import/player.png-be2216fcaabb5c62aa2466cd9a5726a8.stex  �4      �      [~>�"vH����u��y    res://Builder Mode Scene.tscn   `      T      �Q䢔V���u�FV���   res://LoginPanel.gd.remap    T      %       1v.�����{'�-   res://LoginPanel.gdc�	      �      I��:��Z��p^�S7�   res://MainScene.tscn`      �       ��a�����N�x�;   res://Menu.tscn �      '      � %�y�b2�b|�    res://Player Camera2D.gd.remap  0T      *       ��aM���a�e�e   res://Player Camera2D.gdc          �       B�X1��Ż��k~�   res://Player.gd.remap   `T      !       ��0�F �qq��dX��   res://Player.gdc�      8      0R����*�D�l��bh   res://PvP Mode.tscn             /�G����չ�$�H��    res://TLS/tls_certificate.crt                
��_ �m5FD���    res://assets/enemy.png.import   �(      �      Z���=�66#L��$   res://assets/player-kopi.png.import 2      �      A��iӟyi�?(��00G    res://assets/player.png.import  �7      �      �K�N���	%S_����   res://default_env.tres   :      �       um�`�N��<*ỳ�8   res://icon.png   U      �      G1?��z�c��vN��   res://icon.png.import   0H      �      �����%��(#AB�   res://project.binary�a      �      ���\�.!!e;È�Ǔ�$   res://singletons/GameServer.gd.remap�T      0       z|12@+��7��\    res://singletons/GameServer.gdc �J      �       92��oHw�I�I)X,   res://singletons/MatchmakingServer.gd.remap �T      7       �i���;�o���(   res://singletons/MatchmakingServer.gdc  �K      a      w4ґ�L>\��9Sp    [gd_scene format=2]

[node name="Builder Mode Scene" type="Node2D"]

[node name="Player" type="KinematicBody2D" parent="."]

[node name="CollisionShape2D" type="CollisionShape2D" parent="Player"]

[node name="Sprite" type="Sprite" parent="Player"]

[node name="Player Camera2D" type="Camera2D" parent="Player"]

[node name="Map" type="Node2D" parent="."]

[node name="Player area" type="Node2D" parent="Map"]

[node name="TileMap" type="TileMap" parent="Map"]
format = 1

[node name="Free Land" type="Node2D" parent="Map"]

[node name="Camera2D" type="Camera2D" parent="."]
            GDSC      
      �      ����ڶ��   ������������޶��   �������������ض�   ������������ض��   �����϶�   ������¶   ����������������Ķ��   ������������ض��   �������Ҷ���   �����������������Ҷ�   ������Ӷ   �������������Ҷ�   �������Ӷ���   �����������Ӷ���      res://PvP Mode.tscn       pressed       request_token         failure       token_not_received        success       token_received              Error:                                  
                           	      
   '      (      3      >      ?      @      H      N      T      U      `      g      m      n      v            3YYY;�  VYY5;�  W�  YYY0�  PQX=V�  �  T�  P�  RR�  Q�  �  �  T�  P�  RR�  Q�  �  T�  P�  RR�  QYYY0�  PQX=V�  �  T�  �  �  �  T�  PQYY0�	  P�
  V�  QX=V�  �?  P�  �
  Q�  �  T�  �	  YY0�  PQX=V�  �  PQT�  P�  QY`   [gd_scene format=2]

[node name="MainScene" type="Node2D"]

[node name="Node2D" type="Node2D" parent="."]
position = Vector2( 1, 0 )
     [gd_scene load_steps=2 format=2]

[ext_resource path="res://LoginPanel.gd" type="Script" id=3]

[node name="Menu" type="Control"]
anchor_right = 1.0
anchor_bottom = 1.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="LoginPanel" type="Panel" parent="."]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -193.0
margin_top = -69.5
margin_right = 193.0
margin_bottom = 69.5
script = ExtResource( 3 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Label" type="Label" parent="LoginPanel"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -112.0
margin_top = -31.5
margin_right = 117.0
margin_bottom = -17.5
text = "Display Name:"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="LineEdit" type="LineEdit" parent="LoginPanel"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -114.5
margin_top = -12.0
margin_right = 114.5
margin_bottom = 12.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ConnectButton" type="Button" parent="LoginPanel"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -112.589
margin_top = 21.6189
margin_right = -36.5892
margin_bottom = 46.6189
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Label" type="Label" parent="LoginPanel/ConnectButton"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -26.0
margin_top = -7.0
margin_right = 26.0
margin_bottom = 7.0
text = "Connect"
__meta__ = {
"_edit_use_anchors_": false
}
         GDSC                   �����ׄ򶶶�   �������Ŷ���   ����׶��   ����ض��                                     3YYY0�  P�  V�  QX=V�  �  PQY`            GDSC            �      ������������τ�   ����Ҷ��   �����������¶���   �������϶���   ����¶��   ����������������Ҷ��   ϶��   ζ��   ���������Ҷ�   �������Ŷ���   ����׶��   ������¶   ������������������������ض��   �������������Ӷ�   ,        move_up          	   move_down      	   move_left      
   move_right                     
                        $      *   	   3   
   9      B      H      Q      W      a      d      e      p      w      ~      �      3YY8;�  VYY0�  PQX�  V�  ;�  V�  PQ�  &�  T�  P�  QV�  �  T�  �  �  &�  T�  P�  QV�  �  T�  �  �  &�  T�  P�  QV�  �  T�  �  �  &�  T�  P�  QV�  �  T�  �  �  �  �  T�  PQ�  �  .�  YY0�	  P�
  V�  QX=V�  ;�  �  PQ�  �  P�  PQQ�  �  P�  QY`        [gd_scene load_steps=7 format=2]

[ext_resource path="res://assets/enemy.png" type="Texture" id=1]
[ext_resource path="res://Player.gd" type="Script" id=2]
[ext_resource path="res://Player Camera2D.gd" type="Script" id=3]
[ext_resource path="res://assets/player.png" type="Texture" id=4]

[sub_resource type="CircleShape2D" id=1]
radius = 45.0

[sub_resource type="CircleShape2D" id=2]
radius = 44.4035

[node name=" PvP Mode Scene" type="Node2D"]
position = Vector2( 3.63367, 1.81686 )

[node name="Player" type="KinematicBody2D" parent="."]
position = Vector2( 100, 0 )
script = ExtResource( 2 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="Player"]
shape = SubResource( 1 )

[node name="Player Camera2D" type="Camera2D" parent="Player"]
current = true
script = ExtResource( 3 )

[node name=" Player sprite" type="Sprite" parent="Player"]
texture = ExtResource( 4 )

[node name="Enemy" type="KinematicBody2D" parent="."]
position = Vector2( 400, 0 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="Enemy"]
shape = SubResource( 2 )

[node name="Enemy Camera2D" type="Camera2D" parent="Enemy"]

[node name="Enemy sprite" type="Sprite" parent="Enemy"]
texture = ExtResource( 1 )

[node name="Map" type="Node2D" parent="."]

[node name="TileMap" type="TileMap" parent="Map"]
cell_size = Vector2( 30, 30 )
format = 1

[node name="Player area" type="Node2D" parent="Map"]
position = Vector2( -3.63367, -1.81686 )

[node name="Enemy area" type="Node2D" parent="Map"]
position = Vector2( -3.63367, -1.81686 )

[node name="Flag zone" type="Node2D" parent="Map"]
position = Vector2( -3.63367, -1.81686 )

[node name="Main Camera2D" type="Camera2D" parent="."]
position = Vector2( -3.63367, -1.81686 )
zoom = Vector2( 3, 3 )
-----BEGIN CERTIFICATE-----
MIIFFDCCAvygAwIBAgIVAJP+tfDOwtum3zmvdClS9WzL2WmCMA0GCSqGSIb3DQEB
CwUAMDkxETAPBgNVBAMMCERlbnRhZ3JhMRcwFQYDVQQKDA5EZSBzZWplIGd1dHRl
cjELMAkGA1UEBhMCREswHhcNMTQwMTAxMDAwMDAwWhcNMzQwMTAxMDAwMDAwWjA5
MREwDwYDVQQDDAhEZW50YWdyYTEXMBUGA1UECgwORGUgc2VqZSBndXR0ZXIxCzAJ
BgNVBAYTAkRLMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA1jqYU1LF
M/hgsllYUaDQdstyBtiNRBmjnIzVSoij7LPthl2ho4Am/BPlaPwIOJSI6SGMKytJ
Zaqct3e5pNrPQsQMDReP58fNz0goBow1YOXrwUT2wypXSFHV44GPjwrWADxldqdE
QN9GKI+VWjZ71jATmtu1MybOEin3oBIAriPsZx9tprAq6pUWX/QXeO+lUgAwnIu9
a4yE/ZwOAP77Xzh0rtmbUVdrkOH35Yovuw9c9Q+PenboHZnxq5vJEV4pKCu9g0si
d3yIKwcufEBaQ9bgvDuQUiKToAFOIKxSqao6EdmwqaJQGL+MaAtae6zxS1AAIx4p
+ph7XKkF0mqm2svL+6BWbrSMfDLIgXMM092tMF0mO5N24cp7NyrEGlgjvnC516f3
5UBoj/3Idc9LURO3MtDjT7f1hzF7pAvEt0TSbI7Wy4isPoPoamRux9T67lBB2Joj
SpoZhNPdfRZOeiu2Z2Pi6YtANuTc2LjNqC1knRCdz8eWXccA/LTe4HWS+P3p2OwX
2xj0kj2dnBYw6DW0u/9teB+M2ot9emE1Yxzx4eopACmcDkqMi8jo0KbxSlczPIAc
ygLiu/VK1ur7gndyl3eiGDFGyojUa8UmP1ns0fTpxGS/a08x49chVbpDBdAzgIU1
ILqemdHYciB15b5vqFYGT1EomL8QlzHnSC8CAwEAAaMTMBEwDwYDVR0TBAgwBgEB
/wIBADANBgkqhkiG9w0BAQsFAAOCAgEANpuID4yYOE4a04iY1ZhuHFdaE5xblXdK
8nYhQ7tR0oJ/lSxp6oGv3R2GbxPso2KbYNxxVwUypZZpQx9Mcs/jdq3wuDKNVA54
PESGpMs7VJhZfkPIOjvngB/8mPGF30HbHF+gq7vGFgZQUQvz+k0p7+ugTZFYMqJU
HMoG5A4SnrLcD2mYdx4wced0L1fAyCBVL1nUsj27x3xAPSTJf9sA2xMn+5kGuPgj
C30zYTeCdX259doqz3Z1+9pNPDFjdnAvzPxOXgYX3EBJ1VVcIJVv/Y1z7ixD/2Aq
pO6KGVz598RPAdw7egthsMJFGScn2RINqpabzNrBoM+zRz0eg50cI7SHu4uyHXDT
WCE5mG0rwVOZlCwLN8NlBSNxE6kQWFQvnnylgdrdtrV7m8oYs+HnvwFgVUGJ1X6F
05sEKm4XIfB/U8hPXSQmPgbnpwV+u83Lcfj6RfrMkswkxUbYn41vPax6kB3rhjqp
HlSRBBLZq/AFWTDpKUkB5K4dKKmsvWBFFAshZ8TVyDT6Fw8M7ntYzsgOOBqIQnMn
xb9ij3tM1ATYsfFt7mYFmtj+gNRseTDMYwFag53UDwtSqkepJBX4c7bdCOCOyQZ6
Cn1RxxEYfVDYByVGsG8TNjopkwdiKNgkeB/WFNCMKIpm5NIXf87CQmZq4JS35zVa
x6MbUtHm9xM=
-----END CERTIFICATE-----
  GDSTP   �           {  PNG �PNG

   IHDR   P   �   ��.�   sRGB ���  1IDATx���An�0 Q�ʡ��p�t[J,����|�I]U@F�i�!K9���M[������R��/�\T�2 d@h�z���k
�@Ȁ���9pG�#�Y��!B�2 d@Ȁ��#��j�-�rB�e��|=�#��ƟhQ�+lXRq��
}	GlXd�R&́#70:^)�{ߙG�~��i�U+�!B�U��Ͼ+��u;]#=�!BG��2-�i�#2 d@Ȁ��5ˮu�Z'G d@Ȁв%9�h=��{c��!B�2 d@ȀP�5ҳ���!B�2 d@Ȁ�!B�2 d@Ȁ�!BiΉ�:�2 d@Ȁ�!B������<�~b=�!Bk��i�;~s� �2 t�Ȭ��u��#2 d@�:f�����'3 d@Ȁ�����vl��;��']��q��lp�Έ0b�#���כz�<m�W6��4k�����_:ͳr�2 �i�W�qB�2 d@Ȁ�!B3�DR,~pB��́��(j�$��#2 d@Ȁ���9N��    IEND�B`�         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/enemy.png-63f114c7bb3f2105c232c34f647cbc2d.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://assets/enemy.png"
dest_files=[ "res://.import/enemy.png-63f114c7bb3f2105c232c34f647cbc2d.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
      GDST`   `           w  PNG �PNG

   IHDR   `   `   �w8   sRGB ���  -IDATx��[hU����ln�&��C+��UAS-�[m}Q��RE�E�(>H��؊>��� � �Z�>y��� ��D�Uac�es�ݙ߇�M7�����#����d�?�������_h������H��K��9�v�KD�+l��K ��Q�/`J`D���8܂� ��hE����W�x�� ߻"X���;�I�{���S� 3"��^N6
�7~��_����Mt���Z��B>'��c�6zT�4�V5��xTX��?rp�!�hՅ��� ���R��eID��UE��[��0�t �	����]U^V������j��3l� {�*h4�}��������5!�Z�u�A$�D�	p�_ז��|~��®���dJp��D� �p��Z�4��w�7~I�.'h��F/r�����(�Q�	(/T��^�����-Q�)��l).��]�,�p/�7��(�-�����%�$ML��3��&g��Ћ��jl(7+b)RF (�
��J�?2�ɑ�{����8<�˩ӝ̈́�;�'��K��9v r{V�o*0�s����:P���.N����q7 8Q��{"���D'c�w�늶:��u4�D5|B5ĩj���I���	���5�%�0<�şs�C� {�t*z+�v��6��0<�5i�";�DnwZ��\`�:(�L�W��iD$��Dt{Z�D�^��_K�����d3eM&g��R����e�٘4��ލ���[�l���N���Z}���Q�f�t; U��~֏fo��[�ƅ�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�x�aZ��ﶮ�&2��0���/�����ݞu�iݝ��H��#����t$-dㆦS4��ؓ���#�PZĖ�����EƖb%=@tȉ��i1}�5�=�ΕM}U.��+&��p�I�/�j����gEM�Ȃ�|���]k�F�����te�)nх���/Z��t��͋筒����E��t!+���8]~>�yV�����pte��̍W�3c�~ ��F�s6_��w@z���VCcJ3��
�	������zf���U�i���QD����Yw�뮱��i��9&J�LN�[tTj��S��@{Q�(�T��X���t���"I�C��xX�/ *4s��BH_�&�fQ�� j�6�|����c�(�(�
�4�q�q�8}|�'�s�O�r�U��|���-ʗ��;�#�Q��PY���w`'��^�C��ۀ?��!"��x�\WK���'�ƹQF�Y�~Q��`���Յ�&˩xGa��S2� j
oAup`9���^�?3p(eK2)Eq���������
dZ�-��c���J'-�ފ+G\q6i| N@�J�";�+�A�m�F����g��i����r*'!�Bq�]�����^@}�Sߢ|�3��ߚ5栫��E    IEND�B`�             [remap]

importer="texture"
type="StreamTexture"
path="res://.import/player-kopi.png-9d260e0aea970c774628962ecb557b1c.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://assets/player-kopi.png"
dest_files=[ "res://.import/player-kopi.png-9d260e0aea970c774628962ecb557b1c.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
  GDSTP   �           �  PNG �PNG

   IHDR   P   �   ��.�   sRGB ���  UIDATx����Q�0@a�I%i'����Hr����؎��~�o[y�mf�Zi�E�w{s��?�]��?_������?��7��Ȁ�!B�Ni�4]]���ʛ���06��2 d@Ȁ�!B��܉����Ee�@Ȁ����������qB|~����Z$�u͜8����#�z������궘k^`r����
�?�Թ��=��;WaȀ�!B��W�����~�`�*��:Z����Ut���2 d@�_��he�r�`@ȀЩken���-<�;!B�2 d@Ȁ��v�H����8!B�2 d@Ȁ�!B�2 d@Ȁ�!B�ڹ'R�tV�#2 d@Ȁ�!B��w����rZ��E�=��Eu2 d@ȀВ{"�����j����!B|>8ގ%�ÈrB�2 T�tVlY{�ˮ���=ٰ���z�'?`�� bn��L��7o\n㏔ޱ��'C;g�Ǧ#���'�yW�B�Z���3��!B�2 d@ȀЖ;�&N{9!B�����=���$�#2 d@Ȁ��(>��"�&    IEND�B`�     [remap]

importer="texture"
type="StreamTexture"
path="res://.import/player.png-be2216fcaabb5c62aa2466cd9a5726a8.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://assets/player.png"
dest_files=[ "res://.import/player.png-be2216fcaabb5c62aa2466cd9a5726a8.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
   [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @           9  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx�ݜytTU��?��WK*�=���%�  F����0N��݂:���Q�v��{�[�����E�ӋH���:���B�� YHB*d_*�jyo�(*M�JR!h��S�T��w�߻���ro���� N�\���D�*]��c����z��D�R�[�
5Jg��9E�|JxF׵'�a���Q���BH�~���!����w�A�b
C1�dB�.-�#��ihn�����u��B��1YSB<%�������dA�����C�$+(�����]�BR���Qsu][`
�DV����у�1�G���j�G͕IY! L1�]��� +FS�IY!IP ��|�}��*A��H��R�tQq����D`TW���p\3���M���,�fQ����d��h�m7r�U��f������.��ik�>O�;��xm��'j�u�(o}�����Q�S�-��cBc��d��rI�Ϛ�$I|]�ơ�vJkZ�9>��f����@EuC�~�2�ym�ش��U�\�KAZ4��b�4������;�X婐����@Hg@���o��W�b�x�)����3]j_��V;K����7�u����;o�������;=|��Ŗ}5��0q�$�!?��9�|�5tv�C�sHPTX@t����w�nw��۝�8�=s�p��I}�DZ-̝�ǆ�'�;=����R�PR�ۥu���u��ǻC�sH`��>�p�P ���O3R�������۝�SZ7 �p��o�P!�
��� �l��ހmT�Ƴێ�gA��gm�j����iG���B� ܦ(��cX�}4ۻB��ao��"����� ����G�7���H���æ;,NW?��[��`�r~��w�kl�d4�������YT7�P��5lF�BEc��=<�����?�:]�������G�Μ�{������n�v��%���7�eoݪ��
�QX¬)�JKb����W�[�G ��P$��k�Y:;�����{���a��&�eפ�����O�5,;����yx�b>=fc�* �z��{�fr��7��p���Ôִ�P����t^�]͑�~zs.�3����4��<IG�w�e��e��ih�/ˆ�9�H��f�?����O��.O��;!��]���x�-$E�a1ɜ�u�+7Ȃ�w�md��5���C.��\��X��1?�Nغ/�� ��~��<:k?8��X���!���[���꩓��g��:��E����>��꩓�u��A���	iI4���^v:�^l/;MC��	iI��TM-$�X�;iLH���;iI1�Zm7����P~��G�&g�|BfqV#�M������%��TM��mB�/�)����f����~3m`��������m�Ȉ�Ƽq!cr�pc�8fd���Mۨkl�}P�Л�汻��3p�̤H�>+���1D��i�aۡz�
������Z�Lz|8��.ִQ��v@�1%&���͏�������m���KH�� �p8H�4�9����/*)�aa��g�r�w��F36���(���7�fw����P��&�c����{﹏E7-f�M�).���9��$F�f r �9'1��s2).��G��{���?,�
�G��p�µ�QU�UO�����>��/�g���,�M��5�ʖ�e˃�d����/�M`�=�y=�����f�ӫQU�k'��E�F�+ =΂���
l�&���%%�������F#KY����O7>��;w���l6***B�g)�#W�/�k2�������TJ�'����=!Q@mKYYYdg��$Ib��E�j6�U�,Z�鼌Uvv6YYYԶ��}( ���ߠ#x~�s,X0�����rY��yz�	|r�6l����cN��5ϑ��KBB���5ϡ#xq�7�`=4A�o�xds)�~wO�z�^��m���n�Ds�������e|�0�u��k�ٱ:��RN��w�/!�^�<�ͣ�K1d�F����:�������ˣ����%U�Ą������l{�y����)<�G�y�`}�t��y!��O@� A� Y��sv:K�J��ՎۣQ�܃��T6y�ǯ�Zi
��<�F��1>�	c#�Ǉ��i�L��D�� �u�awe1�e&')�_�Ǝ^V�i߀4�$G�:��r��>h�hݝ������t;)�� &�@zl�Ұր��V6�T�+����0q��L���[t���N&e��Z��ˆ/����(�i啝'i�R�����?:
P].L��S��E�݅�Á�.a6�WjY$F�9P�«����V^7���1Ȓ� �b6�(����0"�k�;�@MC���N�]7 �)Q|s����QfdI���5 ��.f��#1���G���z���>)�N�>�L0T�ۘ5}��Y[�W뿼mj���n���S?�v��ْ|.FE"=�ߑ��q����������p����3�¬8�T�GZ���4ݪ�0�L�Y��jRH��.X�&�v����#�t��7y_#�[�o��V�O����^�����paV�&J�V+V��QY����f+m��(�?/������{�X��:�!:5�G�x���I����HG�%�/�LZ\8/����yLf�Æ>�X�Єǣq���$E������E�Ǣ�����gێ��s�rxO��x孏Q]n���LH����98�i�0==���O$5��o^����>6�a� �*�)?^Ca��yv&���%�5>�n�bŜL:��y�w���/��o�褨A���y,[|=1�VZ�U>,?͑���w��u5d�#�K�b�D�&�:�����l~�S\���[CrTV�$����y��;#�������6�y��3ݸ5��.�V��K���{�,-ւ� k1aB���x���	LL� ����ңl۱������!U��0L�ϴ��O\t$Yi�D�Dm��]|�m���M�3���bT�
�N_����~uiIc��M�DZI���Wgkn����C��!xSv�Pt�F��kڨ��������OKh��L����Z&ip��
ޅ���U�C�[�6��p���;uW8<n'n��nͽQ�
�gԞ�+Z	���{���G�Ĭ� �t�]�p;躆 ��.�ۣ�������^��n�ut�L �W��+ ���hO��^�w�\i� ��:9>3�=��So�2v���U1z��.�^�ߋěN���,���� �f��V�    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
GDSC                   ���Ӷ���   �����϶�                                                 	   	   
   
                                             3YYYYYYYYY0�  PQX=V�  -YYYYYY`       GDSC   "      9   (     ���Ӷ���   ������Ŷ   ������Ӷ   ������Ӷ   ��������������ڶ   ������������¶��   ��������������¶   ����   ������������   �������Ŷ���   �����׶�   ���ڶ���   ���������Ŷ�   �����������������Ӷ�   ���������������������Ҷ�   ����������Ӷ   ��������������������������Ӷ   ������������ض��   ������¶   ����Ķ��   �������������ڶ�   ����   ����������ڶ   ������������ض��   ����ض��   �������Ķ���   ���������¶�   ���������Ӷ�   ���������������Ķ���   ��������������Ҷ   ���Ӷ���   ������ض   ����������������Ҷ��   ����������Ӷ      wss://localhost:2093   �        res://TLS/tls_certificate.crt                data_received         receive_token         connection_error      connection_closed         server_close_request      close_requested       No internet connection.       failure             success    (   Matchmaking server could not be reached.   3   Not enough players to start game. Please try again.    0   Connection to matchmaking server ended abruptly.                                                    	       
   &      '      (      )      4      5      ;      <      =      >      I      P      Y      `      a      b      j      o      p      {      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2     3     4     5     6     7     8   &  9   3YYB�  YB�  P�  QYYY8;�  VY;�  V�  T�  PQYY:�  V�  YYYY0�	  P�
  V�  QX=V�  �  �  T�  PQYYYY0�  P�  V�  QX=V�  �  T�  P�  Q�  ;�  V�L  P�  Q�  �  T�  P�  QYYY0�  PQX=V�  �  P�  Q�  �  �  T�  P�  RR�  Q�  �  T�  P�  RR�  Q�  �  T�  P�  RR�  Q�  �  T�  P�  RR�	  Q�  �  ;�  V�  T�  P�  Q�  &�  �  V�  �?  P�
  Q�  �  P�  QYYY0�  PQX=V�  ;�  V�  T�  P�  QT�  PQ�  �?  P�  T�  PQQ�  �  P�  QYYYY0�  PQX=V�  �  P�  R�  QYY0�  P�  V�  R�  V�  QX=V�  &�  �  V�  �  P�  R�  QYY0�   P�!  V�  QX=V�  &�!  V�  �  P�  R�  QY`               [remap]

path="res://LoginPanel.gdc"
           [remap]

path="res://Player Camera2D.gdc"
      [remap]

path="res://Player.gdc"
               [remap]

path="res://singletons/GameServer.gdc"
[remap]

path="res://singletons/MatchmakingServer.gdc"
         �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name         Dentagra   application/run/main_scene         res://Menu.tscn    application/config/icon         res://icon.png     autoload/MatchmakingServer0      &   *res://singletons/MatchmakingServer.gd     autoload/GameServer(         *res://singletons/GameServer.gd .   debug/gdscript/warnings/return_value_discarded          .   debug/gdscript/warnings/unsafe_property_access         ,   debug/gdscript/warnings/unsafe_method_access         #   debug/gdscript/warnings/unsafe_cast         ,   debug/gdscript/warnings/unsafe_call_argument            gdnative/singletons             input/move_up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script         input/move_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script         input/move_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script         input/move_down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script         network/ssl/certificates(         res://TLS/tls_certificate.crt   )   rendering/environment/default_environment          res://default_env.tres       