{
	"type": "fx",
	"cullingRadius": 200,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.5,
			"scaleY": 0.5,
			"scaleZ": 0.5,
			"children": [
				{
					"type": "object",
					"name": "----------------------------SandWorm",
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "model",
							"name": "Sandworm",
							"source": "Character/Creatures/Sandworm/Sandworm.fbx",
							"z": -0.4,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"animation": "Character/Creatures/Sandworm/Anim_Sandworm_UnitDestruction.fbx",
							"children": [
								{
									"type": "model",
									"name": "FX_Mesh_WormSand_Planes_R",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_WormSand_Planes.fbx",
									"x": 3.18,
									"y": 3.64,
									"z": 1.06,
									"scaleX": 1.02,
									"scaleY": 1.02,
									"scaleZ": 1.02,
									"rotationZ": -22.3,
									"retargetAnim": true,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.01443253789097071,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.956483263447882,
															"value": 1,
															"mode": 2
														},
														{
															"time": 10.007875294685364,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.3
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 1,
												"width": 0.6,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_05.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.3
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "width",
													"keys": [
														{
															"time": 0.01443253789097071,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.005907413363458,
															"value": 1,
															"mode": 2
														},
														{
															"time": 9.995046372115613,
															"value": -0.014999999999999902,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "FX_Mesh_WormSand_Planes_L",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_WormSand_Planes.fbx",
									"x": -11,
									"y": 9.57,
									"z": 1.36,
									"scaleX": 1.02,
									"scaleY": 1.02,
									"scaleZ": 1.02,
									"rotationZ": 98.18,
									"retargetAnim": true,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.01443253789097071,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.956483263447882,
															"value": 1,
															"mode": 2
														},
														{
															"time": 9.995046372115613,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.3
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 1,
												"width": 0.6,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_05.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.3
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "width",
													"keys": [
														{
															"time": 0.01443253789097071,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.005907413363458,
															"value": 1,
															"mode": 2
														},
														{
															"time": 9.982217449545862,
															"value": 0.0011111111111111738,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "FX_Mesh_WormSand_Planes",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_WormSand_Planes.fbx",
									"x": 8.33,
									"y": -11.64,
									"z": 1.97,
									"scaleX": 1.02,
									"scaleY": 1.02,
									"scaleZ": 1.02,
									"rotationZ": -139.09,
									"retargetAnim": true,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.01443253789097071,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.956483263447882,
															"value": 1,
															"mode": 2
														},
														{
															"time": 9.96938852697611,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.3
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 1,
												"width": 0.6,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_05.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.3
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "width",
													"keys": [
														{
															"time": 0.01443253789097071,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.967420645654203,
															"value": 0.9838888888888889,
															"mode": 2
														},
														{
															"time": 9.982217449545862,
															"value": 0.0011111111111111738,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "FX_Mesh_WormSand",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_WormSand.fbx",
									"z": 10,
									"scaleX": 1.01,
									"scaleY": 1.01,
									"scaleZ": 1.01,
									"rotationZ": 90,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl05u_A.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0.01443253789097071,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.956483263447882,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.692542695887388,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.3
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 1,
												"width": 0.6,
												"uvScaleX": 6,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_05.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.3
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "width",
													"keys": [
														{
															"time": 0.01443253789097071,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.00782534217614,
															"value": 0.9666666666666667,
															"mode": 2
														},
														{
															"time": 8.322528612538378,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Character/Creatures/Sandworm/Anim_Sandworm_UnitDestruction.fbx",
									"speed": 0.7,
									"duration": 15
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.FX_Mesh_WormSand",
							"target": "FXAnimation.FXRoot.Sandworm.root.Root.B_Spine07",
							"positionOnly": true
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Sandworm.FX_Mesh_WormSand_Planes_R",
							"target": "FXAnimation.FXRoot.Sandworm.root.Root.B_Spine07.B_Jaw_R",
							"positionOnly": true
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Sandworm.FX_Mesh_WormSand_Planes_L",
							"target": "FXAnimation.FXRoot.Sandworm.root.Root.B_Spine07.B_Jaw_L",
							"positionOnly": true
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Sandworm.FX_Mesh_WormSand_Planes",
							"target": "FXAnimation.FXRoot.Sandworm.root.Root.B_Spine07.B_Jaw",
							"positionOnly": true
						}
					]
				},
				{
					"type": "object",
					"name": "----------------------------MeshFloor",
					"z": -0.7999999999999998,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "model",
							"name": "FX_Mesh_Hole_Wave1",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_WormHole.fbx",
							"x": 0.69,
							"y": 0.92,
							"scaleX": 115,
							"scaleY": 115,
							"scaleZ": 70,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "DecalPass",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"parallax": 0,
											"alphaKill": false,
											"textureWrap": true,
											"culling": "None"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/water-normal.png",
									"materialName": "any",
									"mainPassName": "decal",
									"color": [
										1,
										1,
										1,
										0.6196078431372549
									]
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.05
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftY",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5889575647424751,
													"mode": 0,
													"prevHandle": {
														"dv": -0.2030617595307854,
														"dt": -0.5285567216692888
													},
													"nextHandle": {
														"dv": 0.2030617595307854,
														"dt": 0.5285567216692888
													}
												},
												{
													"time": 2.0070136642456062,
													"value": 0.9971872282979152,
													"mode": 0,
													"prevHandle": {
														"dv": -0.053466222087225214,
														"dt": -0.6664291176355124
													},
													"nextHandle": {
														"dv": 0.11435975294846779,
														"dt": 1.425435841083527
													}
												},
												{
													"time": 6.357116601422243,
													"value": 1.2092268455254838,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01728149250926969,
														"dt": -0.3768564372014227
													},
													"nextHandle": {
														"dv": 0.01728149250926969,
														"dt": 0.3768564372014227
													}
												},
												{
													"time": 7.877776150379872,
													"value": 1.4164003229199644,
													"mode": 0,
													"prevHandle": {
														"dv": -0.018865458940196693,
														"dt": -0.31892315369373636
													},
													"nextHandle": {
														"dv": 0.010529421241202819,
														"dt": 0.196339518830575
													}
												},
												{
													"time": 8.829514999389652,
													"value": 1.3336560471022154,
													"mode": 0,
													"prevHandle": {
														"dv": 0.025896684674310277,
														"dt": -0.12565829431114217
													},
													"nextHandle": {
														"dv": -0.025896684674310277,
														"dt": 0.12565829431114217
													}
												},
												{
													"time": 10.0338433373021,
													"value": 1.2466994165491176,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.45208797401443057
													},
													"nextHandle": {
														"dv": -4.3961665330458295e-17,
														"dt": 1.279020829623036
													}
												},
												{
													"time": 12.063910588403239,
													"value": 1.3842429012914255,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.671282143233548
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.671282143233548
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 12,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 6,
										"power": 0.7
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "SandBlend",
									"source": "shaders/SandBlend.hx",
									"props": {
										"colorMask": "Fx/DistortionMaps/water-normal.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.1
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.39411790583324585,
														"dt": -0.6833453225022693
													},
													"nextHandle": {
														"dv": 0.6,
														"dt": 1.0423318803956618
													}
												},
												{
													"time": 3.9812247966982763,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -1.3270749322327589
													},
													"nextHandle": {
														"dv": 0,
														"dt": 2.0062584011005744
													}
												},
												{
													"time": 10,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -2
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3344527711758432
													}
												},
												{
													"time": 12,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3344527711758432
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3344527711758432
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "width",
											"keyMode": 0,
											"keys": [
												{
													"time": 8.991759480288605,
													"value": 0.9666666666666667,
													"mode": 2
												},
												{
													"time": 11.98478185801811,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.03333333333333333,
														"dt": -1.0274726682146138
													},
													"nextHandle": {
														"dv": -0.021459181479217142,
														"dt": 0.6614616735645786
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.28,
										"sandColorSet": false,
										"envBlend": 0.49,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"tex": "Fx/DistortionMaps/perlin2Normal.jpg",
										"intensity": 3,
										"scrollSpeed": [
											0.1,
											0
										],
										"smoothEdge": 1,
										"texScaleX": 0,
										"texScaleY": 0
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.03333333333333333,
											"mode": 0,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 2,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 8.5,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 10.012034335046051,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5374966395597701
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5576157120804043
											}
										},
										{
											"time": 11.498792790732264,
											"value": 0.2842057353059453,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5576157120804043
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5576157120804043
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.4199931476418095,
												"dt": -0.3899013843179381
											},
											"nextHandle": {
												"dv": 0.5085449218750002,
												"dt": 0.4701580382836485
											}
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										},
										{
											"time": 9.052765669963849,
											"value": 1.0678710937500002,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 12,
											"value": 1.2,
											"mode": 0,
											"prevHandle": {
												"dv": 0.012817382812500222,
												"dt": -0.575384694200185
											},
											"nextHandle": {
												"dv": -0.012817382812500222,
												"dt": 0.575384694200185
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.2887486510907556,
												"dt": -0.4505847957252515
											},
											"nextHandle": {
												"dv": 0.3666666666666667,
												"dt": 0.5741896459403781
											}
										},
										{
											"time": 2.0046242512204118,
											"value": 0.9666666666666667,
											"mode": 2
										},
										{
											"time": 8.948734062307118,
											"value": 1.1666666666666667,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 12,
											"value": 1.2,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5374966395597701
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5576157120804043
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "FX_Mesh_Disc_Wave2",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
							"x": -0.25,
							"y": 0.23,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 90,
							"rotationX": -1.3,
							"rotationY": -0.9,
							"rotationZ": 81.8,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"parallax": 0,
											"alphaKill": false,
											"textureWrap": true,
											"culling": "None"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/water-normal.png",
									"materialName": "any",
									"color": [
										1,
										1,
										1,
										0.8
									]
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": true,
										"replace": false,
										"alpha": 1.7,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/vGrad.png",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 0.9900542813725819,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "SandBlend",
									"source": "shaders/SandBlend.hx",
									"enabled": false,
									"props": {
										"colorMask": "Fx/DistortionMaps/sand-normal.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/noise/T_Noise_Grunge_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.2
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.39411790583324585,
														"dt": -0.6833453225022693
													},
													"nextHandle": {
														"dv": 0.6,
														"dt": 1.0423318803956618
													}
												},
												{
													"time": 3.9812247966982763,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -1.3270749322327589
													},
													"nextHandle": {
														"dv": 0,
														"dt": 2.0062584011005744
													}
												},
												{
													"time": 10,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -2
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3344527711758432
													}
												},
												{
													"time": 12,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3344527711758432
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3344527711758432
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "width",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 8.991759480288605,
													"value": 0.9666666666666667,
													"mode": 2
												},
												{
													"time": 11.98478185801811,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.03333333333333333,
														"dt": -1.0274726682146138
													},
													"nextHandle": {
														"dv": -0.021459181479217142,
														"dt": 0.6614616735645786
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": false,
										"Y": false,
										"Z": true,
										"tex": "Fx/DistortionMaps/waveNormal02.jpg",
										"intensity": 2,
										"scrollSpeed": [
											0.07,
											0
										],
										"smoothEdge": 1,
										"texScaleX": 0,
										"texScaleY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": false,
												"Y": false,
												"Z": true,
												"tex": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 2,
												"scrollSpeed": [
													0.07,
													0
												],
												"smoothEdge": 1,
												"texScaleX": 0,
												"texScaleY": 0
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 2,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0.05
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftY",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0.5889575647424751,
													"mode": 0,
													"prevHandle": {
														"dv": -0.2030617595307854,
														"dt": -0.5285567216692888
													},
													"nextHandle": {
														"dv": 0.2030617595307854,
														"dt": 0.5285567216692888
													}
												},
												{
													"time": 2.0665936965221054,
													"value": 1.0791103967737266,
													"mode": 0,
													"prevHandle": {
														"dv": -0.053466222087225214,
														"dt": -0.6664291176355124
													},
													"nextHandle": {
														"dv": 0.11435975294846779,
														"dt": 1.425435841083527
													}
												},
												{
													"time": 6.094366827225598,
													"value": 1.1895128818088108,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01728149250926969,
														"dt": -0.3768564372014227
													},
													"nextHandle": {
														"dv": 0.01728149250926969,
														"dt": 0.3768564372014227
													}
												},
												{
													"time": 7.961900304880187,
													"value": 1.349789289874135,
													"mode": 1,
													"prevHandle": {
														"dv": -0.017865132000196415,
														"dt": -0.33005734065722425
													},
													"nextHandle": {
														"dv": -0.005807272262854601,
														"dt": 0.1253104835266292
													}
												},
												{
													"time": 8.167978963989807,
													"value": 1.2835375731668357,
													"mode": 0,
													"prevHandle": {
														"dv": 0.012681809074260517,
														"dt": -0.05664852215156791
													},
													"nextHandle": {
														"dv": -0.012681809074260517,
														"dt": 0.05664852215156791
													}
												},
												{
													"time": 10.24288962831663,
													"value": 1.105620548659211,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0026832781061876254,
														"dt": -1.0585994862573003
													},
													"nextHandle": {
														"dv": -2.1472084788649014e-16,
														"dt": 1.3053274928188434
													}
												},
												{
													"time": 13.03761528586038,
													"value": 1.5079941248010715,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.671282143233548
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.671282143233548
													}
												}
											]
										}
									]
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"enabled": false,
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/water-normal.png",
									"topSpan": 0,
									"dirBrighten": true,
									"dirIntensity": 0.15,
									"dirSpan": 0.36,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									}
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.03333333333333333,
											"mode": 0,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 1.9837633948726578,
											"value": 0.9889465332031244,
											"mode": 2
										},
										{
											"time": 8.483763394872659,
											"value": 0.9889465332031244,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 9.982446090011585,
											"value": 1.4039465332031238,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5374966395597701
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5576157120804043
											}
										},
										{
											"time": 11.482556185604922,
											"value": 0.7731522685090703,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5576157120804043
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5576157120804043
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										},
										{
											"time": 9,
											"value": 0.9788818359375001,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 11.991979671475278,
											"value": 1.2583333333333333,
											"mode": 0,
											"prevHandle": {
												"dv": 0.012817382812500222,
												"dt": -0.575384694200185
											},
											"nextHandle": {
												"dv": -0.012817382812500222,
												"dt": 0.575384694200185
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										},
										{
											"time": 9,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 11.971430218110987,
											"value": 1.2933333333333332,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5374966395597701
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5576157120804043
											}
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "FX_Quad_NormalSphere",
							"x": -0.86,
							"y": 0.62,
							"z": 1.21,
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 40,
							"kind": 0,
							"args": [
								0
							],
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"drawOrder": "110"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/SphereInvert.png"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1.35,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/circGrad02.jpg",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0020158038283648455,
													"value": 0.04999999999999999,
													"mode": 0,
													"prevHandle": {
														"dv": -0.4061137171708171,
														"dt": -0.45844293772877864
													},
													"nextHandle": {
														"dv": 0.7833333333333332,
														"dt": 0.8842686650822024
													}
												},
												{
													"time": 2.992924523959344,
													"value": 0.9833333333333334,
													"mode": 2
												},
												{
													"time": 9.963042236960233,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.7961486387494505e-16,
														"dt": -2.288695368448052
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.31209482297018987
													}
												},
												{
													"time": 11.991658586266462,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -1.2223713899665736
													},
													"nextHandle": {
														"dv": -1.0749677459182325e-16,
														"dt": 0.684874750406804
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 2,
										"power": 0.8
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"enabled": false,
									"props": {
										"X": false,
										"Y": false,
										"Z": true,
										"tex": "Fx/DistortionMaps/waveNormal02.jpg",
										"intensity": 1,
										"scrollSpeed": [
											0.2,
											0
										],
										"smoothEdge": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.74,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "scale.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										},
										{
											"time": 8.896718258478753,
											"value": 1.0707592592592592,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 10.509208177158063,
											"value": 1.6089037037037033,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5374966395597701
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3467720255224324
											}
										},
										{
											"time": 11.54952425372536,
											"value": 1.3686412345679009,
											"mode": 0,
											"prevHandle": {
												"dv": 0.012817382812500222,
												"dt": -0.575384694200185
											},
											"nextHandle": {
												"dv": -0.012817382812500222,
												"dt": 0.575384694200185
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										},
										{
											"time": 8.87071035656457,
											"value": 1.0797037037037036,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 10.509208177158063,
											"value": 1.4437037037037035,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5461659401978309
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3467720255224324
											}
										},
										{
											"time": 11.54952425372536,
											"value": 1.2684444444444443,
											"mode": 0,
											"prevHandle": {
												"dv": 0.012817382812500222,
												"dt": -0.575384694200185
											},
											"nextHandle": {
												"dv": -0.012817382812500222,
												"dt": 0.575384694200185
											}
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "FX_Quad_Shadow",
							"x": -0.38,
							"y": 0.63,
							"z": 0.86,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 45,
							"kind": 0,
							"args": [
								0
							],
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"drawOrder": "110"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/circGrad3.jpg",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0020158038283648455,
													"value": 0.04999999999999999,
													"mode": 0,
													"prevHandle": {
														"dv": -0.11404057550378031,
														"dt": -0.5518588873105065
													},
													"nextHandle": {
														"dv": 0.2833333333333334,
														"dt": 1.3705007316549398
													}
												},
												{
													"time": 2.2961989605054325,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.1332861581817357,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.08527397911671919
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.2790290658921011
													}
												},
												{
													"time": 4.403349492587161,
													"value": 0.6333333333333333,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.13951453294605054
													},
													"nextHandle": {
														"dv": 0,
														"dt": 2.0937732129738698
													}
												},
												{
													"time": 9.963042236960233,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.30847338063156404,
														"dt": -2.2463687194485513
													},
													"nextHandle": {
														"dv": -0.09999999999999998,
														"dt": 0.7282212535971091
													}
												},
												{
													"time": 11.991658586266462,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -1.2223713899665736
													},
													"nextHandle": {
														"dv": -1.0749677459182325e-16,
														"dt": 0.684874750406804
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 0.2,
										"power": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.74,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "scale.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										},
										{
											"time": 8.896718258478753,
											"value": 1.0707592592592592,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 10.509208177158063,
											"value": 1.6089037037037033,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5374966395597701
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3467720255224324
											}
										},
										{
											"time": 11.54952425372536,
											"value": 1.3686412345679009,
											"mode": 0,
											"prevHandle": {
												"dv": 0.012817382812500222,
												"dt": -0.575384694200185
											},
											"nextHandle": {
												"dv": -0.012817382812500222,
												"dt": 0.575384694200185
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										},
										{
											"time": 8.87071035656457,
											"value": 1.0797037037037036,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 10.509208177158063,
											"value": 1.4437037037037035,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5461659401978309
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3467720255224324
											}
										},
										{
											"time": 11.54952425372536,
											"value": 1.2684444444444443,
											"mode": 0,
											"prevHandle": {
												"dv": 0.012817382812500222,
												"dt": -0.575384694200185
											},
											"nextHandle": {
												"dv": -0.012817382812500222,
												"dt": 0.575384694200185
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "-------------------------------Impact",
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "model",
							"name": "FX_Mesh_Disc_Wave_Impact",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
							"x": 0.33,
							"y": 0.33,
							"z": 0.12,
							"scaleX": 114.95043656871684,
							"scaleY": 112.64571739533447,
							"scaleZ": 44.20267987087482,
							"rotationX": -1.2,
							"rotationY": -0.7,
							"rotationZ": 81.8,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Forward",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"parallax": 0,
											"alphaKill": false,
											"textureWrap": true,
											"culling": "None"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/water-normal.png",
									"materialName": "any",
									"color": [
										1,
										1,
										1,
										0.6588235294117647
									]
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl05u_A.jpg",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 8.105746478430241,
													"value": 0,
													"mode": 2
												},
												{
													"time": 8.249592651980286,
													"value": 0.9640625,
													"mode": 2
												},
												{
													"time": 9.5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6027839653525747
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6027839653525747
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "SandBlend",
									"source": "shaders/SandBlend.hx",
									"props": {
										"colorMask": "Fx/DistortionMaps/sand-normal.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/noise/T_Noise_Grunge_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.39411790583324585,
														"dt": -0.6833453225022693
													},
													"nextHandle": {
														"dv": 0.6,
														"dt": 1.0423318803956618
													}
												},
												{
													"time": 3.9812247966982763,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -1.3270749322327589
													},
													"nextHandle": {
														"dv": 0,
														"dt": 2.0062584011005744
													}
												},
												{
													"time": 10,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -2
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3344527711758432
													}
												},
												{
													"time": 12,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3344527711758432
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3344527711758432
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "width",
											"keyMode": 0,
											"keys": [
												{
													"time": 8.991759480288605,
													"value": 0.9666666666666667,
													"mode": 2
												},
												{
													"time": 11.98478185801811,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.03333333333333333,
														"dt": -1.0274726682146138
													},
													"nextHandle": {
														"dv": -0.021459181479217142,
														"dt": 0.6614616735645786
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.28,
										"sandColorSet": false,
										"envBlend": 0.49,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": false,
										"Y": false,
										"Z": true,
										"tex": "Fx/DistortionMaps/waveNormal02.jpg",
										"intensity": 2,
										"scrollSpeed": [
											0.07,
											0
										],
										"smoothEdge": 1,
										"texScaleX": 0,
										"texScaleY": 0
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 2,
										"scaleY": 2,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftY",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5889575647424751,
													"mode": 0,
													"prevHandle": {
														"dv": -0.2030617595307854,
														"dt": -0.5285567216692888
													},
													"nextHandle": {
														"dv": 0.2030617595307854,
														"dt": 0.5285567216692888
													}
												},
												{
													"time": 2.0665936965221054,
													"value": 1.0791103967737266,
													"mode": 0,
													"prevHandle": {
														"dv": -0.053466222087225214,
														"dt": -0.6664291176355124
													},
													"nextHandle": {
														"dv": 0.11435975294846779,
														"dt": 1.425435841083527
													}
												},
												{
													"time": 6.0097022352724245,
													"value": 1.4248214378891468,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01728149250926969,
														"dt": -0.3768564372014227
													},
													"nextHandle": {
														"dv": 0.01728149250926969,
														"dt": 0.3768564372014227
													}
												},
												{
													"time": 8.105746478430241,
													"value": 1.4444718526687512,
													"mode": 0,
													"prevHandle": {
														"dv": 0.010871654343855397,
														"dt": -0.20549453364292436
													},
													"nextHandle": {
														"dv": -0.010871654343855397,
														"dt": 0.20549453364292436
													}
												},
												{
													"time": 12.03069207101007,
													"value": 0.9241832245781265,
													"mode": 0,
													"prevHandle": {
														"dv": 0.318696169460688,
														"dt": -3.575604885386861
													},
													"nextHandle": {
														"dv": -0.009250220937818226,
														"dt": 0.10378265679233566
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.03333333333333333,
											"mode": 0,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 1.9837633948726578,
											"value": 0.9889465332031244,
											"mode": 2
										},
										{
											"time": 8.483763394872659,
											"value": 0.9889465332031244,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 9.982446090011585,
											"value": 1.4039465332031238,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5374966395597701
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5576157120804043
											}
										},
										{
											"time": 11.482556185604922,
											"value": 0.7731522685090703,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5576157120804043
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5576157120804043
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										},
										{
											"time": 9,
											"value": 0.9788818359375001,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 11.991979671475278,
											"value": 1.2583333333333333,
											"mode": 0,
											"prevHandle": {
												"dv": 0.012817382812500222,
												"dt": -0.575384694200185
											},
											"nextHandle": {
												"dv": -0.012817382812500222,
												"dt": 0.575384694200185
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.4599421803338519,
												"dt": -0.35355339059327384
											},
											"nextHandle": {
												"dv": 0.37267485996087424,
												"dt": 0.28810272488437155
											}
										},
										{
											"time": 2,
											"value": 1,
											"mode": 2
										},
										{
											"time": 9,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -2.238220981693159
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5374966395597701
											}
										},
										{
											"time": 11.971430218110987,
											"value": 1.2933333333333332,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5374966395597701
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5576157120804043
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Distort_Chockwave",
							"props": {
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.2,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9098039215686274,
									0.615686274509804,
									1,
									0.8509803921568627
								],
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"lifeTime": 2.5,
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -8,
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale": 1.8
							},
							"z": 0.745,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.05,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/Ring.fbx",
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"culling": "None"
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/perlin2Normal.jpg",
												"intensity": 0.01
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.8043636363636364,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5969588995728569,
																"dt": -0.2623791435549754
															},
															"nextHandle": {
																"dv": -0.5969588995728569,
																"dt": 0.2623791435549754
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.08425454545454536,
																"dt": -0.2350000000000001
															},
															"nextHandle": {
																"dv": -0.08425454545454536,
																"dt": 0.2350000000000001
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.5,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.01
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/bluenoise_raw.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.5
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5350976805491343,
															"value": 0.9422222222222223,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.03695353771889259
															},
															"nextHandle": {
																"dv": -6.922428196740585e-16,
																"dt": 0.24478506621704163
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5,
																"dt": -0.18500000000000005
															},
															"nextHandle": {
																"dv": -0.8474237452673484,
																"dt": 0.3135467857489186
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0049999999999999975,
											"value": 0.0402048299726524,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9239350146379692,
												"dt": -0.3456633226416698
											},
											"nextHandle": {
												"dv": 0.12028199966650588,
												"dt": 0.045000000000000005
											}
										},
										{
											"time": 1,
											"value": 1.0158254939343108,
											"mode": 0,
											"prevHandle": {
												"dv": -0.026729333259223442,
												"dt": -0.865
											},
											"nextHandle": {
												"dv": 0.0103433736750329,
												"dt": 0.33472657705803693
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									1,
									1,
									1,
									0.8509803921568627
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 15,
								"emitType": "Burst",
								"burstParticleCount": 25,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 45,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 1,
								"useRandomColor": true,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0.05,
									0,
									0
								],
								"instAcceleration": [
									0.1,
									0,
									0
								],
								"warmUpTime": -8.05,
								"seedGroup": 39,
								"emitAngle": 360
							},
							"z": 1.61,
							"scaleX": 90,
							"scaleY": 90,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": -0.032777777777777795,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.05083333333333336
															}
														},
														{
															"time": 0.08,
															"value": 0.9833333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07562525672400151,
																"dt": -0.02399211269568948
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.2643750000000001
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.8,
												"color": [
													0.8745098039215686,
													0.8745098039215686,
													0.8745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 0.2,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8483515290485304,
																"dt": -0.43041364341432775
															},
															"nextHandle": {
																"dv": -1.1333333333333333,
																"dt": 0.575
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.7,
											"envBlend": 0.5,
											"envColorSet": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.009999999999999995,
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									1,
									1,
									1,
									0.8509803921568627
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 15,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 41,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 1,
								"useRandomColor": true,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0.05,
									0,
									0
								],
								"instAcceleration": [
									0.1,
									0,
									0
								],
								"warmUpTime": -7.9,
								"emitAngle": 360
							},
							"z": 1.61,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": -0.032777777777777795,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.05083333333333336
															}
														},
														{
															"time": 0.08,
															"value": 0.9833333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07562525672400151,
																"dt": -0.02399211269568948
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.2643750000000001
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0,
												"color": [
													0.8745098039215686,
													0.8745098039215686,
													0.8745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 0.3,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8483515290485304,
																"dt": -0.43041364341432775
															},
															"nextHandle": {
																"dv": -1.1333333333333333,
																"dt": 0.575
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.7,
											"envBlend": 0.5,
											"envColorSet": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.009999999999999995,
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									1,
									1,
									1,
									0.8509803921568627
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 15,
								"emitType": "Burst",
								"burstParticleCount": 15,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 37,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 1,
								"useRandomColor": true,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0.05,
									0,
									0
								],
								"instAcceleration": [
									0.1,
									0,
									0
								],
								"warmUpTime": -7.8,
								"seedGroup": 83,
								"emitAngle": 360
							},
							"z": 1.61,
							"scaleX": 55,
							"scaleY": 55,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": -0.032777777777777795,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.05083333333333336
															}
														},
														{
															"time": 0.08,
															"value": 0.9833333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07562525672400151,
																"dt": -0.02399211269568948
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.2643750000000001
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.8,
												"color": [
													0.8745098039215686,
													0.8745098039215686,
													0.8745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 0.4,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8483515290485304,
																"dt": -0.43041364341432775
															},
															"nextHandle": {
																"dv": -1.1333333333333333,
																"dt": 0.575
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.6,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.7,
											"envBlend": 0.5,
											"envColorSet": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.009999999999999995,
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Little_Distort",
							"props": {
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.2,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9098039215686274,
									0.615686274509804,
									1,
									0.8509803921568627
								],
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"lifeTime": 2,
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"instScale": 130,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -8,
								"emitAngle": 360
							},
							"z": 3.23,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.05,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"culling": "None"
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/sand-normal.png",
												"intensity": 0.005
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.8043636363636364,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1438836500205134,
																"dt": -0.4763721338556696
															},
															"nextHandle": {
																"dv": -0.2551111111111112,
																"dt": 0.10551280456700678
															}
														},
														{
															"time": 1,
															"value": 0.004242424242424214,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03333333333333333,
																"dt": -0.51
															},
															"nextHandle": {
																"dv": -0.02178544542538359,
																"dt": 0.33331731500836026
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.5,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.01
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.48,
												"saturation": 0,
												"width": 0.58,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Noise_Grunge_06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5350976805491343,
															"value": 0.9422222222222223,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.03695353771889259
															},
															"nextHandle": {
																"dv": -6.922428196740585e-16,
																"dt": 0.24478506621704163
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5,
																"dt": -0.18500000000000005
															},
															"nextHandle": {
																"dv": -0.8474237452673484,
																"dt": 0.3135467857489186
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.6101554739171128,
												"dt": -0.33018814592265844
											},
											"nextHandle": {
												"dv": 0.9136438538946278,
												"dt": 0.49018439845683004
											}
										},
										{
											"time": 1,
											"value": 1.29108698853561,
											"mode": 0,
											"prevHandle": {
												"dv": -0.11323294039229448,
												"dt": -0.39715416696622907
											},
											"nextHandle": {
												"dv": 0.09487993739524597,
												"dt": 0.33286343471616847
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaKill",
							"source": "shaders/AlphaKill.hx",
							"props": {
								"threshold": 0.01,
								"useRGB": false
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "--------------------------SmokeSand",
					"children": [
						{
							"type": "emitter",
							"name": "CenterSand",
							"props": {
								"emitShape": "Cylinder",
								"emitSurface": true,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationLoop": false,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instScale": 55,
								"instScale_rand": 5,
								"lifeTime": 4,
								"emitRad1": 0.64,
								"emitRad2": 0.8,
								"animationSpeed": 0.1,
								"instStretch_rand": [
									0.1,
									0.1,
									0.1
								],
								"warmUpTime": -3,
								"emitType": "Burst",
								"burstCount": 6,
								"burstDelay": 0.2,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"emitAngle": 360
							},
							"x": -0.69,
							"y": -0.95,
							"z": 3.4799999999999995,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.8
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.022919865223606062,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": -0.03333333333333333,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2,
												"power": 0.1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 1,
												"width": 0.25,
												"uvScaleX": 1,
												"uvScaleY": 0.6,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06666666666666667
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.26666666666666666
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Smoke_IN",
							"props": {
								"lifeTime": 4,
								"alignMode": "Screen",
								"instScale_rand": 5,
								"maxCount": 100,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"simulationSpace": "World",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0.1,
								"randomColor1": [
									1,
									1,
									0.9490196078431372,
									1
								],
								"randomColor2": [
									1,
									1,
									1,
									0.8588235294117647
								],
								"emitRate": 4,
								"lifeTimeRand": 1,
								"instSpeed": [
									0.03,
									0,
									0.04
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"useRandomColor": true,
								"enableSort": false,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"animationLoop": false,
								"instScale": 35,
								"warmUpTime": -2.2,
								"emitType": "BurstDuration",
								"emitDuration": 5,
								"burstDelay": 0.1,
								"emitSurface": true,
								"emitAngle": 360
							},
							"z": 0.4,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 0.05,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.052118579484834636
															}
														},
														{
															"time": 0.46309124831222936,
															"value": 1.0221265432098763,
															"mode": 1,
															"prevHandle": {
																"dv": -0.016756172839506034,
																"dt": -0.21210617923720687
															},
															"nextHandle": {
																"dv": 0.028240740740740677,
																"dt": 0.3402408169486359
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016756172839506145,
																"dt": -0.12256179689880853
															},
															"nextHandle": {
																"dv": -0.010920947383032816,
																"dt": 0.08037303296607651
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.01,
												"useRGB": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8745098039215686,
													0.8745098039215686,
													0.8745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.6,
												"saturation": 0,
												"width": 0.6,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0.01
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3283333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3283333333333333
															}
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.4,
											"dirIntensity": 0.6,
											"sandBlend": 0.6,
											"envBlend": 0.5
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2,
												"power": 1
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.019999999999999997,
											"value": 0.7850000000000001,
											"mode": 2
										},
										{
											"time": 0.245,
											"value": 1.0908097451790637,
											"mode": 0,
											"prevHandle": {
												"dv": -0.061403662613847505,
												"dt": -0.08343956833586955
											},
											"nextHandle": {
												"dv": 0.32246091597796145,
												"dt": 0.4385714285714285
											}
										},
										{
											"time": 1,
											"value": 1.5405299586776862,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Smoke_IN_Late",
							"props": {
								"lifeTime": 4,
								"alignMode": "Screen",
								"instScale_rand": 5,
								"maxCount": 100,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"simulationSpace": "World",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0.1,
								"randomColor1": [
									1,
									1,
									0.9490196078431372,
									1
								],
								"randomColor2": [
									1,
									1,
									1,
									0.8705882352941177
								],
								"emitRate": 4,
								"lifeTimeRand": 1,
								"instSpeed": [
									0.03,
									0,
									0.04
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"useRandomColor": true,
								"enableSort": false,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"animationLoop": false,
								"instScale": 35,
								"warmUpTime": -6,
								"emitType": "BurstDuration",
								"emitDuration": 5,
								"burstDelay": 0.12,
								"emitSurface": true,
								"emitAngle": 360
							},
							"z": 0.4,
							"scaleX": 25,
							"scaleY": 25,
							"scaleZ": 0.05,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.052118579484834636
															}
														},
														{
															"time": 0.46309124831222936,
															"value": 1.0221265432098763,
															"mode": 1,
															"prevHandle": {
																"dv": -0.016756172839506034,
																"dt": -0.21210617923720687
															},
															"nextHandle": {
																"dv": 0.028240740740740677,
																"dt": 0.3402408169486359
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016756172839506145,
																"dt": -0.12256179689880853
															},
															"nextHandle": {
																"dv": -0.010920947383032816,
																"dt": 0.08037303296607651
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.01,
												"useRGB": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8745098039215686,
													0.8745098039215686,
													0.8745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.6,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0.01
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3283333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3283333333333333
															}
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.4,
											"dirIntensity": 0.6,
											"sandBlend": 0.6,
											"envBlend": 0.5
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 3,
												"power": 1
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.019999999999999997,
											"value": 0.7850000000000001,
											"mode": 2
										},
										{
											"time": 0.245,
											"value": 1.0908097451790637,
											"mode": 0,
											"prevHandle": {
												"dv": -0.061403662613847505,
												"dt": -0.08343956833586955
											},
											"nextHandle": {
												"dv": 0.32246091597796145,
												"dt": 0.4385714285714285
											}
										},
										{
											"time": 1,
											"value": 1.5405299586776862,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaKill",
							"source": "shaders/AlphaKill.hx",
							"props": {
								"threshold": 0.1,
								"useRGB": false
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "-----------------------------------End",
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "emitter",
							"name": "Sand",
							"props": {
								"instScale_rand": 10,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.8901960784313725,
									0.8901960784313725,
									0.8901960784313725,
									0.5411764705882353
								],
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 3,
								"emitShape": "Cylinder",
								"emitRad1": 0.4,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 50,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 1,
								"useRandomColor": true,
								"instStretch_rand": [
									0,
									0,
									0.2
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -9.9,
								"emitType": "Burst",
								"burstCount": 3,
								"burstDelay": 0.1,
								"instStretch": [
									1,
									1,
									1.3
								],
								"emitAngle": 360
							},
							"z": 1.68,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": -0.032777777777777795,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8471464463961964,
																"dt": -0.09649254743649578
															},
															"nextHandle": {
																"dv": 0.5249907407407408,
																"dt": 0.018432477257208604
															}
														},
														{
															"time": 0.4259803742923469,
															"value": 0.949462962962963,
															"mode": 0,
															"prevHandle": {
																"dv": 0.15357650287272287,
																"dt": -0.03027673375928191
															},
															"nextHandle": {
																"dv": -1.117722222222222,
																"dt": 0.2203525767682118
															}
														},
														{
															"time": 0.9909674189501751,
															"value": -0.016407098765432115,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1.3,
												"color": [
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 0,
												"width": 0.4,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8483515290485304,
																"dt": -0.43041364341432775
															},
															"nextHandle": {
																"dv": -1.1333333333333333,
																"dt": 0.575
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.5,
												"power": 0.1
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.009999999999999995,
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand",
							"props": {
								"instScale_rand": 5,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9058823529411765,
									0.9058823529411765,
									0.9058823529411765,
									0.5411764705882353
								],
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 6,
								"emitOrientation": "Random",
								"emitShape": "Cylinder",
								"emitRad1": 0.4,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 35,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 0.5,
								"useRandomColor": true,
								"instStretch_rand": [
									0,
									0.5,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -9.9,
								"emitType": "Burst",
								"burstCount": 3,
								"burstDelay": 0.1,
								"alignMode": "Screen",
								"instStretch": [
									0.6,
									3.5,
									0.6
								],
								"emitAngle": 360
							},
							"x": -0.07,
							"y": -0.65,
							"z": -0.58,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": -0.032777777777777795,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8471464463961964,
																"dt": -0.09649254743649578
															},
															"nextHandle": {
																"dv": 0.5249907407407408,
																"dt": 0.018432477257208604
															}
														},
														{
															"time": 0.10741110346544785,
															"value": 0.998575,
															"mode": 0,
															"prevHandle": {
																"dv": 0.15357650287272287,
																"dt": -0.03027673375928191
															},
															"nextHandle": {
																"dv": -1.117722222222222,
																"dt": 0.2203525767682118
															}
														},
														{
															"time": 0.9909674189501751,
															"value": -0.016407098765432115,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1.1,
												"color": [
													0.9333333333333333,
													0.9333333333333333,
													0.9333333333333333
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 0,
												"width": 0.3,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8483515290485304,
																"dt": -0.43041364341432775
															},
															"nextHandle": {
																"dv": -1.1333333333333333,
																"dt": 0.575
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.1,
												"power": 0.5
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1.0998755595677854,
											"mode": 0,
											"prevHandle": {
												"dv": -0.13266707309712789,
												"dt": -0.03800263653834093
											},
											"nextHandle": {
												"dv": 0.33164467237718087,
												"dt": 0.09500000000000006
											}
										},
										{
											"time": 1,
											"value": 1.4612197548444152,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand",
							"props": {
								"instScale_rand": 10,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9058823529411765,
									0.9058823529411765,
									0.9058823529411765,
									0.5411764705882353
								],
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 4,
								"emitOrientation": "Random",
								"emitShape": "Cylinder",
								"emitRad1": 0.4,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 40,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"useRandomColor": true,
								"instStretch_rand": [
									0,
									0.3,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -8,
								"emitType": "Burst",
								"burstCount": 2,
								"burstDelay": 0.1,
								"alignMode": "Screen",
								"instStretch": [
									0.5,
									2.5,
									0.54
								],
								"emitAngle": 360
							},
							"z": 3.65,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": -0.032777777777777795,
															"mode": 0,
															"prevHandle": {
																"dv": -2.8471464463961964,
																"dt": -0.09649254743649578
															},
															"nextHandle": {
																"dv": 0.5249907407407408,
																"dt": 0.018432477257208604
															}
														},
														{
															"time": 0.4259803742923469,
															"value": 0.949462962962963,
															"mode": 0,
															"prevHandle": {
																"dv": 0.15357650287272287,
																"dt": -0.03027673375928191
															},
															"nextHandle": {
																"dv": -1.117722222222222,
																"dt": 0.2203525767682118
															}
														},
														{
															"time": 0.9909674189501751,
															"value": -0.016407098765432115,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1.1,
												"color": [
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 0,
												"width": 0.3,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8483515290485304,
																"dt": -0.43041364341432775
															},
															"nextHandle": {
																"dv": -1.1333333333333333,
																"dt": 0.575
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.5,
												"power": 0.1
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.009999999999999995,
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaKill",
							"source": "shaders/AlphaKill.hx",
							"props": {
								"threshold": 0.1,
								"useRGB": false
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}