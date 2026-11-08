{
	"type": "fx",
	"cullingRadius": 75,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.5,
			"scaleY": 0.5,
			"scaleZ": 0.5,
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"z": 0.02,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "subFX",
					"name": "Ability_Consolidation",
					"source": "Fx/Abilities/Ability_Consolidation.fx",
					"enabled": false,
					"x": 62.79679,
					"y": 149.21182,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2
				},
				{
					"type": "object",
					"name": "Sonar",
					"children": [
						{
							"type": "advancedDecal",
							"name": "Scan",
							"x": -1.7763568394002505e-15,
							"scaleX": 280,
							"scaleY": 280,
							"scaleZ": 100,
							"albedoMap": "Fx/Alphas/T_circle5.png",
							"fadePower": 0.52,
							"emissive": 0.5,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Gradients/cGrad.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0.5,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 6,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Border",
							"x": -1.7763568394002505e-15,
							"scaleX": 225,
							"scaleY": 225,
							"scaleZ": 100,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.52,
							"emissive": 5,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/FloorScan_Round_12_1024.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 1.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0.2,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 6,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/cGrad.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Grille",
							"x": -1.7763568394002505e-15,
							"scaleX": 215,
							"scaleY": 215,
							"scaleZ": 100,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.52,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/FloorScan_Round_10_grille_1024_01.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0.5,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.75,
										"uvScaleY": 1.25,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0.25
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "GrilleCircle",
							"x": -1.7763568394002505e-15,
							"scaleX": 215,
							"scaleY": 215,
							"scaleZ": 100,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.52,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.3,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/FloorScan_Round_10_1024_01.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "vOffset",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 10,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0.5,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.75,
										"uvScaleY": 1.25,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0.25
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.84,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.075,
											0.05
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "GrilleCircleRotation",
							"x": -1.7763568394002505e-15,
							"scaleX": 215,
							"scaleY": 215,
							"scaleZ": 100,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.52,
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.2,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/cGrad.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.3,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/FloorScan_Round_10_1024_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 6,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.75,
										"uvScaleY": 1.25,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0.25
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Niddle",
							"x": -1.7763568394002505e-15,
							"scaleX": 206,
							"scaleY": 225,
							"scaleZ": 100,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.52,
							"emissive": 0.5,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0.001,
										"vOffset": 1,
										"texture": "Fx/Alphas/FloorScan_Tail.png"
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 6,
											"value": 1,
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
								"envBlend": 1,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							}
						},
						{
							"type": "polygon",
							"name": "GrilleRotation",
							"z": 1,
							"scaleX": 103,
							"scaleY": 103,
							"rotationZ": -164.99999999999997,
							"kind": 1,
							"args": [
								24,
								360,
								0,
								4
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
											"colorMask": 255,
											"emissive": 3
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 12,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl15u_A02.png"
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
										"uvShift": [
											0,
											-0.01
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad_inv.png",
										"uvShift": [
											0,
											0.01
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1.05,
													"mode": 2
												},
												{
													"time": 6,
													"value": 0.05,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_end",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.87,
										"saturation": 1,
										"width": 0.3,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A01.png",
										"uvShift": [
											0,
											0.6
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.8
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.2,
										"sandColorSet": false,
										"envBlend": 1,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "Sonar_backup",
					"enabled": false,
					"x": -194.4794,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Scan",
							"x": -1.7763568394002505e-15,
							"scaleX": 300,
							"scaleY": 300,
							"scaleZ": 100,
							"albedoMap": "Fx/Alphas/T_circle5.png",
							"fadePower": 0.52,
							"emissive": 0.1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.55,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Gradients/cGrad.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 1.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0.2,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 6,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.7254901960784313,
											0.3411764705882353,
											0.18823529411764706
										],
										"pointA": 0,
										"colorB": [
											1,
											0.788235294117647,
											0.5529411764705883
										],
										"pointB": 0.33
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.1,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Border",
							"x": -1.7763568394002505e-15,
							"scaleX": 225,
							"scaleY": 225,
							"scaleZ": 100,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.52,
							"emissive": 9,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/FloorScan_Round_12_1024.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 1.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0.2,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.8470588235294118,
											0.6745098039215687
										]
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 6,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.3,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/cGrad.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.25,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Grille",
							"x": -1.7763568394002505e-15,
							"scaleX": 215,
							"scaleY": 215,
							"scaleZ": 100,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.52,
							"emissive": 4,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.15,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/FloorScan_Round_10_grille_1024.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0.5,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.8470588235294118,
											0.6745098039215687
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
										"progress": 0.35,
										"saturation": 0.65,
										"width": 0.8,
										"uvScaleX": 0.75,
										"uvScaleY": 1.25,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0.25
										]
									}
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.25,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "GrilleRotation",
							"x": -1.7763568394002505e-15,
							"scaleX": 215,
							"scaleY": 215,
							"scaleZ": 100,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.52,
							"emissive": 8,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.25,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/FloorScan_Round_10_1024.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "vOffset",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 10,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.3,
													"mode": 2
												},
												{
													"time": 1.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0.3,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.8470588235294118,
											0.6745098039215687
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
										"progress": 0.35,
										"saturation": 0.65,
										"width": 0.8,
										"uvScaleX": 0.75,
										"uvScaleY": 1.25,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0.25
										]
									}
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.25,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.335,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/cGrad.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 6,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1.2
							}
						}
					]
				}
			]
		}
	]
}