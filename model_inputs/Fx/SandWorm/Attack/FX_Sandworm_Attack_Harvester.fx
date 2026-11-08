{
	"type": "fx",
	"duration": 15,
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "polygon",
			"editorOnly": true,
			"z": 0.6639999999999999,
			"scaleX": 2400,
			"scaleY": 2400,
			"scaleZ": 1.2,
			"color": -14869219,
			"kind": 0,
			"args": [
				0
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"z": 0.3999999999999999,
			"scaleX": 0.5,
			"scaleY": 0.5,
			"scaleZ": 0.5,
			"children": [
				{
					"type": "model",
					"name": "Vehicule_Harvester",
					"source": "Vehicle/Atreide/Harvester/Vehicule_Harvester.fbx",
					"z": -0.6666666666666665,
					"scaleX": 6,
					"scaleY": 6,
					"scaleZ": 6,
					"rotationZ": 125.45,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Harvester/Anim_Harvester_WormDestruction_Death.fbx",
							"duration": 35,
							"offset": -2
						}
					],
					"enabled": false
				},
				{
					"type": "object",
					"name": "----------------------------SandWorm",
					"z": -0.6666666666666665,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "model",
							"name": "Sandworm",
							"source": "Character/Creatures/Sandworm/Sandworm.fbx",
							"z": -0.15999999999999992,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"animation": "Character/Creatures/Sandworm/Anim_Sandworm_HarvesterDestruction.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Character/Creatures/Sandworm/Anim_Sandworm_HarvesterDestruction.fbx",
									"duration": 35
								}
							]
						},
						{
							"type": "model",
							"name": "FX_Mesh_WormSand_Planes_L",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_WormSand_Planes.fbx",
							"x": -10.38,
							"y": 9.06,
							"z": 3.07,
							"scaleX": 2.0399999999999996,
							"scaleY": 2.0399999999999996,
							"scaleZ": 2.04,
							"rotationZ": 103.8,
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
													"time": 0.6696867179870609,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3386912727355964,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.1660920203978904,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.615647361907877,
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
													"time": 3.6227465396043854,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.759889689490783,
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
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.----------------------------SandWorm.FX_Mesh_WormSand_Planes_L",
							"target": "FXAnimation.FXRoot.----------------------------SandWorm.Sandworm.root.Root.B_Spine07.B_Jaw_L",
							"positionOnly": true
						},
						{
							"type": "model",
							"name": "FX_Mesh_WormSand_Planes_R",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_WormSand_Planes.fbx",
							"x": 3.45,
							"y": 3.78,
							"z": 2.47,
							"scaleX": 2.04,
							"scaleY": 2.04,
							"scaleZ": 2.04,
							"rotationZ": -19.2,
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
													"time": 0.6696867179870609,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3386912727355964,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.1660920203978904,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.615647361907877,
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
													"time": 3.348753828080488,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.632026424112964,
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
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.----------------------------SandWorm.FX_Mesh_WormSand_Planes_R",
							"target": "FXAnimation.FXRoot.----------------------------SandWorm.Sandworm.root.Root.B_Spine07.B_Jaw_R",
							"positionOnly": true
						},
						{
							"type": "model",
							"name": "FX_Mesh_WormSand_Planes",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_WormSand_Planes.fbx",
							"x": 8.05,
							"y": -11.91,
							"z": 2.14,
							"scaleX": 2.04,
							"scaleY": 2.04,
							"scaleZ": 2.04,
							"rotationZ": -139.1,
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
													"time": 0.6696867179870609,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3386912727355964,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.1660920203978904,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.615647361907877,
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
													"time": 3.1660920203978904,
													"value": 0.9838888888888889,
													"mode": 2
												},
												{
													"time": 5.540695520271665,
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
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.----------------------------SandWorm.FX_Mesh_WormSand_Planes",
							"target": "FXAnimation.FXRoot.----------------------------SandWorm.Sandworm.root.Root.B_Spine07.B_Jaw",
							"positionOnly": true
						},
						{
							"type": "model",
							"name": "FX_Mesh_WormSand",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_WormSand.fbx",
							"x": 0.32,
							"y": -0.97,
							"z": 12.11,
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"rotationZ": -77.1,
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
										"alpha": 0.8,
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
													"mode": 0,
													"prevHandle": {
														"dv": -0.006816204615649148,
														"dt": -0.4997705895726907
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 1.2090465954002458
													}
												},
												{
													"time": 2.9965818851660253,
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
										"range": 0.5,
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
													"time": 2.2300000000000004,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.813256654681094,
													"value": 0.9666666666666667,
													"mode": 2
												},
												{
													"time": 4.627764983346154,
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
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.5226822833087579,
												"dt": -0.4447835090717692
											},
											"nextHandle": {
												"dv": 1.2666666666666666,
												"dt": 0.37000000000000005
											}
										},
										{
											"time": 2,
											"value": 1.05,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.----------------------------SandWorm.FX_Mesh_WormSand",
							"target": "FXAnimation.FXRoot.----------------------------SandWorm.Sandworm.root.Root.B_Spine07",
							"positionOnly": true
						}
					]
				},
				{
					"type": "object",
					"name": "----------------------------MeshFloor",
					"x": -2.31055,
					"y": -2.93783,
					"z": -0.8,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "model",
							"name": "FX_Mesh_Disc_Wave",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
							"z": -0.88,
							"scaleX": 60,
							"scaleY": 60,
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
											"mode": "DecalPass",
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
									"mainPassName": "decal",
									"color": [
										0.6509803921568628,
										0.6509803921568628,
										0.6509803921568628,
										0.4784313725490196
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
									"name": "SandBlend",
									"source": "shaders/SandBlend.hx",
									"props": {
										"colorMask": "Fx/Alphas/sand.png"
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
											"keyMode": 3,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.5897121296564614,
														"dt": -0.4972240709576539
													},
													"nextHandle": {
														"dv": 0.5897121296564614,
														"dt": 0.4972240709576539
													}
												},
												{
													"time": 2.030632153134594,
													"value": 1,
													"mode": 3
												},
												{
													"time": 5.848307692709392,
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
													"time": 8.262882143510552,
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
													"time": 5.819048803055937,
													"value": 0.9666666666666667,
													"mode": 2
												},
												{
													"time": 8.204364364203641,
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
										"sandBlend": 0.36,
										"sandColorSet": false,
										"envBlend": 0.6,
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
										"texScale": 0,
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
										"scaleX": 2.5,
										"scaleY": 0.5,
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
														"dv": -0.1537674177172215,
														"dt": -1.0211469765691257
													},
													"nextHandle": {
														"dv": 0.09603214055299769,
														"dt": 0.6522133516829257
													}
												},
												{
													"time": 1.7933100481676802,
													"value": 0.8187167047571242,
													"mode": 0,
													"prevHandle": {
														"dv": -0.04828313750322717,
														"dt": -0.6675688748921963
													},
													"nextHandle": {
														"dv": 0.10722093200683624,
														"dt": 1.4824504091083985
													}
												},
												{
													"time": 3.103458107094622,
													"value": 0.8970232866566481,
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
													"time": 4.467755430553825,
													"value": 0.9932647639481474,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.2633300068810973
													},
													"nextHandle": {
														"dv": -0.005807272262854601,
														"dt": 0.1253104835266292
													}
												},
												{
													"time": 4.86347734421492,
													"value": 0.9146494752137112,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16580037470291278
													},
													"nextHandle": {
														"dv": 0.00034144700401350647,
														"dt": 0.5365781993242607
													}
												},
												{
													"time": 5.71669035035452,
													"value": 0.9423422502588333,
													"mode": 1,
													"prevHandle": {
														"dv": -0.013169615609305296,
														"dt": -0.29682543748422585
													},
													"nextHandle": {
														"dv": 0.0079419828726921,
														"dt": 0.5200380167206813
													}
												},
												{
													"time": 9.068974712799932,
													"value": 1.161726096950511,
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
								}
							]
						},
						{
							"type": "model",
							"name": "FX_Mesh_Disc_Wave",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
							"z": -0.88,
							"scaleX": 60,
							"scaleY": 60,
							"scaleZ": 90,
							"rotationX": -1.3,
							"rotationY": -0.9,
							"rotationZ": -5.4,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "DecalPass",
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
									"mainPassName": "decal",
									"color": [
										0.6509803921568628,
										0.6509803921568628,
										0.6509803921568628,
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
										"progress": 0.6,
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
											"keyMode": 3,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.5897121296564614,
														"dt": -0.4972240709576539
													},
													"nextHandle": {
														"dv": 0.5897121296564614,
														"dt": 0.4972240709576539
													}
												},
												{
													"time": 2.030632153134594,
													"value": 1,
													"mode": 3
												},
												{
													"time": 5.874315594623573,
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
													"time": 8.288890045424733,
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
													"time": 5.845056704970117,
													"value": 0.9666666666666667,
													"mode": 2
												},
												{
													"time": 8.230372266117822,
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
										"envBlend": 0.45,
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
										"texScale": 0,
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
										"scaleX": 2.5,
										"scaleY": 0.5,
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
														"dv": -0.1537674177172215,
														"dt": -1.0211469765691257
													},
													"nextHandle": {
														"dv": 0.09603214055299769,
														"dt": 0.6522133516829257
													}
												},
												{
													"time": 1.7933100481676802,
													"value": 0.8187167047571242,
													"mode": 0,
													"prevHandle": {
														"dv": -0.04828313750322717,
														"dt": -0.6675688748921963
													},
													"nextHandle": {
														"dv": 0.10722093200683624,
														"dt": 1.4824504091083985
													}
												},
												{
													"time": 3.1294660090088025,
													"value": 0.8970232866566481,
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
													"time": 4.541816994989134,
													"value": 0.9091437727939724,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.2633300068810973
													},
													"nextHandle": {
														"dv": -0.005807272262854601,
														"dt": 0.1253104835266292
													}
												},
												{
													"time": 5.0687401053309475,
													"value": 0.7970785999759484,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16580037470291278
													},
													"nextHandle": {
														"dv": 0.00034144700401350647,
														"dt": 0.5365781993242607
													}
												},
												{
													"time": 6.019238532438342,
													"value": 0.9423422502588333,
													"mode": 1,
													"prevHandle": {
														"dv": -0.09723571907516038,
														"dt": -0.30905229861980654
													},
													"nextHandle": {
														"dv": 0.0079419828726921,
														"dt": 0.5200380167206813
													}
												},
												{
													"time": 9.068974712799932,
													"value": 1.3574044640660687,
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
								}
							]
						},
						{
							"type": "polygon",
							"name": "FX_Quad_NormalSphere",
							"z": 1.21,
							"scaleX": 40,
							"scaleY": 40,
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
											"mode": "DecalPass",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/SphereInvert.png",
									"mainPassName": "decal"
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
													"time": 6.517756014507738,
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
													"time": 8.952287491997518,
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
										"range": 1,
										"power": 1
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
											"time": 5.045516907842707,
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
											"time": 7.0639219547055685,
											"value": 1.4056046913580236,
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
											"time": 8.510153159456417,
											"value": 1.1653422222222212,
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
											"time": 5.019509005928525,
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
											"time": 7.043372501341276,
											"value": 1.2995267489711924,
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
											"time": 8.489603706092124,
											"value": 1.1242674897119331,
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
											"mode": "DecalPass",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"mainPassName": "decal"
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
														"dv": -0.01522933193383037,
														"dt": -0.13534897779888974
													},
													"nextHandle": {
														"dv": 0.08333333333333337,
														"dt": 0.730960017884442
													}
												},
												{
													"time": 6.517756014507734,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.31097729593480317
													},
													"nextHandle": {
														"dv": -8.393014232169926e-17,
														"dt": 0.7613620900268107
													}
												},
												{
													"time": 8.952287491997515,
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
											"time": 5.045516907842703,
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
											"time": 7.063921954705565,
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
											"time": 8.510153159456413,
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
											"time": 5.019509005928521,
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
											"time": 7.063921954705565,
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
											"time": 8.510153159456413,
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
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 1,
								"ATTENUATE": false,
								"emissiveMap": "Fx/Gradients/ColorSand.png"
							}
						}
					]
				},
				{
					"type": "object",
					"name": "-------------------------------Impact",
					"z": 1.83992,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
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
								"lifeTime": 3,
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -5.8,
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale": 1.3
							},
							"z": 5.5709,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.05,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"scaleX": 130,
									"scaleY": 130,
									"scaleZ": 130,
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
												"intensity": 0.011
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
							"name": "Distort_Chockwave_2",
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
								"lifeTime": 3,
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -4.6,
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale": 1.8
							},
							"z": 5.96589,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.05,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"scaleX": 130,
									"scaleY": 130,
									"scaleZ": 130,
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
												"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
												"intensity": 0.015
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
							"name": "ShockWave",
							"props": {
								"warmUpTime": -4.6,
								"emitType": "Burst",
								"instScale": 100
							},
							"z": 2.27,
							"scaleX": 0.1,
							"scaleY": 0.1,
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
													"culling": "Back",
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
												"alpha": 0.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png",
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.5708015990978788
															},
															"nextHandle": {
																"dv": 0.009785546759570019,
																"dt": 0.33328019978181483
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.8,
												"envColorSet": false
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9865403685451437,
												"dt": -0.40000000000000013
											},
											"nextHandle": {
												"dv": 0.9,
												"dt": 0.3683798050158908
											}
										},
										{
											"time": 1,
											"value": 1,
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
								"threshold": 0.01,
								"useRGB": false
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "emitter",
					"name": "Impact_Burst_Close_SandJet_R",
					"props": {
						"instScale_rand": 3,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							30
						],
						"lifeTimeRand": 0.2,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 12,
						"lifeTime": 3,
						"emitRad1": 0.73,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"instStretch_rand": [
							0,
							0.25,
							0
						],
						"instStretch": [
							1,
							3.8,
							1
						],
						"warmUpTime": -4.78,
						"emitType": "Burst",
						"burstParticleCount": 15,
						"emitAngle": 200,
						"instRotation": [
							0,
							0,
							45
						]
					},
					"x": -2.21,
					"y": -2.08725,
					"z": 0.79,
					"scaleX": 50.00000000000003,
					"scaleY": 40.000000000000014,
					"scaleZ": 0.2,
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
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
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.3
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
													"time": 0.15,
													"value": 1,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.58,
										"saturation": 0,
										"width": 0.5,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.02
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
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
													}
												},
												{
													"time": 1.5,
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
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.3,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Impact_Burst_Close_SandJet_L",
					"props": {
						"instScale_rand": 3,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							30
						],
						"lifeTimeRand": 0.2,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 12,
						"lifeTime": 3,
						"emitRad1": 0.73,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"instStretch_rand": [
							0,
							0.25,
							0
						],
						"instStretch": [
							1,
							3.8,
							1
						],
						"warmUpTime": -4.78,
						"emitType": "Burst",
						"burstParticleCount": 15,
						"emitAngle": 200,
						"instRotation": [
							0,
							0,
							-45
						]
					},
					"x": -2.21,
					"y": -2.08877,
					"z": 0.79,
					"scaleX": 50.00000000000003,
					"scaleY": 40.000000000000014,
					"scaleZ": 0.2,
					"rotationZ": -89.99999999999999,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
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
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.3
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
													"time": 0.15,
													"value": 1,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.58,
										"saturation": 0,
										"width": 0.5,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.02
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
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
													}
												},
												{
													"time": 1.5,
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
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.3,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Impact_Burst_Far_SandJet_R",
					"props": {
						"instScale_rand": 4,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							15
						],
						"lifeTimeRand": 1,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 15,
						"lifeTime": 6,
						"emitRad1": 0.6,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"instStretch_rand": [
							0,
							0.25,
							0
						],
						"instStretch": [
							1,
							2,
							1
						],
						"warmUpTime": -4.93,
						"emitType": "Burst",
						"burstParticleCount": 30,
						"emitAngle": 200,
						"instRotation": [
							0,
							0,
							30
						]
					},
					"x": -2.21,
					"z": 0.79,
					"scaleX": 90.00000000000004,
					"scaleY": 90.00000000000004,
					"scaleZ": 0.2,
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
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
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.4
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
													"time": 0.15,
													"value": 1,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.58,
										"saturation": 0,
										"width": 0.7,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.02
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
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
													}
												},
												{
													"time": 1.5,
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
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.3,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Impact_Burst_Far_SandJet_L",
					"props": {
						"instScale_rand": 4,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							15
						],
						"lifeTimeRand": 1,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 15,
						"lifeTime": 6,
						"emitRad1": 0.6,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"instStretch_rand": [
							0,
							0.25,
							0
						],
						"instStretch": [
							1,
							2,
							1
						],
						"warmUpTime": -4.93,
						"emitType": "Burst",
						"burstParticleCount": 30,
						"emitAngle": 200,
						"instRotation": [
							0,
							0,
							-30
						]
					},
					"x": -2.21,
					"z": 0.79,
					"scaleX": 90.00000000000004,
					"scaleY": 90.00000000000004,
					"scaleZ": 0.2,
					"rotationZ": -89.99999999999999,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
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
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.4
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
													"time": 0.15,
													"value": 1,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.58,
										"saturation": 0,
										"width": 0.7,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.02
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
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
													}
												},
												{
													"time": 1.5,
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
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.3,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Impact_Sphere_SandExplo",
					"props": {
						"instScale_rand": 2,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"lifeTimeRand": 0.2,
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 20,
						"lifeTime": 3,
						"emitRad1": 0.73,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"instStretch_rand": [
							0,
							0,
							0
						],
						"warmUpTime": -4.6,
						"emitType": "Burst",
						"burstParticleCount": 13
					},
					"x": -1.11,
					"y": -0.78,
					"z": 9.77,
					"scaleX": 25.000000000000014,
					"scaleY": 25.000000000000014,
					"scaleZ": 20,
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
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
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.5
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
													"time": 0.15,
													"value": 1,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.58,
										"saturation": 0,
										"width": 0.6,
										"uvScaleX": 0.3,
										"uvScaleY": 0.3,
										"texture": "Fx/noise/T_Noise_Grunge_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.02
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
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
													}
												},
												{
													"time": 1.5,
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
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.29,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "---------------------EarlySmokeSand",
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
								"emitType": "Burst",
								"burstCount": 6,
								"burstDelay": 0.5,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 0.5,
								"randomColor1": [
									1,
									1,
									1,
									1
								]
							},
							"x": -0.69,
							"y": -0.95,
							"z": 4.426,
							"scaleX": 17,
							"scaleY": 17,
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
												"scale": 1
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
															"time": 0.31625311182238486,
															"value": 1.0172222222222222,
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
												"envBlend": 0.7,
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
												"progress": 1,
												"saturation": 1,
												"width": 0.3,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/perlin1.jpg",
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
															"time": 0.2607602160917205,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.17757726633812598
															},
															"nextHandle": {
																"dv": -3.923294750588761e-16,
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
							"name": "Early_Infinity_Close_SmokeSand",
							"props": {
								"instScale_rand": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 15,
								"lifeTime": 3,
								"emitRad1": 0.42,
								"emitRad2": 0.89,
								"randomColor2": [
									0.6705882352941176,
									0.596078431372549,
									0.5568627450980392,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									1,
									1,
									0
								],
								"instSpeed": [
									3,
									1,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0.3
								],
								"instStretch": [
									1,
									1.25,
									1
								]
							},
							"x": 0.98,
							"z": 2.77,
							"scaleX": 60.000000000000014,
							"scaleY": 60.000000000000014,
							"scaleZ": 0.2,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
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
															"time": 0.15,
															"value": 1,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
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
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.4,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.054150392937033276,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.04690160115273982,
												"dt": -0.4991856672119883
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.35477514266967786
											}
										},
										{
											"time": 1.6455703186267312,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.033333333333333326,
												"dt": -1.404426703365851
											},
											"nextHandle": {
												"dv": 0.009170298159871566,
												"dt": 0.3863703484065103
											}
										},
										{
											"time": 3.955216894784094,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0026474846836679242,
												"dt": -0.16666181090700632
											},
											"nextHandle": {
												"dv": -0.016666666666666607,
												"dt": 1.051754150390626
											}
										},
										{
											"time": 7.2307447075122315,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Early_Infinity_IN_SmokeSand",
							"props": {
								"instScale_rand": 2,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 10,
								"lifeTime": 3,
								"emitRad1": 0.42,
								"emitRad2": 0.89,
								"randomColor2": [
									0.6705882352941176,
									0.596078431372549,
									0.5568627450980392,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 10,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instWorldAcceleration_rand": [
									1,
									1,
									0
								],
								"instSpeed": [
									3,
									1,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0.3
								],
								"instStretch": [
									1,
									1.25,
									1
								]
							},
							"x": 0.98,
							"z": 2.77,
							"scaleX": 20.000000000000004,
							"scaleY": 20.000000000000004,
							"scaleZ": 0.2,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
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
															"time": 0.15,
															"value": 1,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
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
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.4,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.054150392937033276,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.04690160115273982,
												"dt": -0.4991856672119883
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.35477514266967786
											}
										},
										{
											"time": 1.6455703186267312,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.033333333333333326,
												"dt": -1.404426703365851
											},
											"nextHandle": {
												"dv": 0.009170298159871566,
												"dt": 0.3863703484065103
											}
										},
										{
											"time": 3.955216894784094,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0026474846836679242,
												"dt": -0.16666181090700632
											},
											"nextHandle": {
												"dv": -0.016666666666666607,
												"dt": 1.051754150390626
											}
										},
										{
											"time": 7.2307447075122315,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Early_Infinity_Close_SandJet_L",
							"props": {
								"instScale_rand": 3,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									30
								],
								"lifeTimeRand": 0.2,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 12,
								"lifeTime": 4,
								"emitRad1": 0.73,
								"randomColor2": [
									0.6705882352941176,
									0.596078431372549,
									0.5568627450980392,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 10,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									3,
									1
								],
								"warmUpTime": -0.2,
								"burstParticleCount": 20,
								"emitAngle": 200,
								"instRotation": [
									0,
									0,
									-45
								]
							},
							"x": -3.43,
							"z": 0.79,
							"scaleX": 50.000000000000014,
							"scaleY": 40.00000000000001,
							"scaleZ": 0.2,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
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
															"time": 0.15,
															"value": 1,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
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
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 5.229604088579032,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.660038693859066,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Early_Infinity_Close_SandJet_R",
							"props": {
								"instScale_rand": 3,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									30
								],
								"lifeTimeRand": 0.2,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 12,
								"lifeTime": 4,
								"emitRad1": 0.73,
								"randomColor2": [
									0.6705882352941176,
									0.596078431372549,
									0.5568627450980392,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 10,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									3,
									1
								],
								"warmUpTime": -0.2,
								"burstParticleCount": 20,
								"emitAngle": 200,
								"instRotation": [
									0,
									0,
									45
								]
							},
							"x": -2.21,
							"z": 0.79,
							"scaleX": 50.000000000000014,
							"scaleY": 40.00000000000001,
							"scaleZ": 0.2,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
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
															"time": 0.15,
															"value": 1,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
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
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 5.229604088579032,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.660038693859066,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Apparition_Burst_Close_SandJet_R",
							"props": {
								"instScale_rand": 3,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									30
								],
								"lifeTimeRand": 0.2,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 12,
								"lifeTime": 3,
								"emitRad1": 0.73,
								"randomColor2": [
									0.6705882352941176,
									0.596078431372549,
									0.5568627450980392,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									3,
									1
								],
								"warmUpTime": -0.2,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitAngle": 200,
								"instRotation": [
									0,
									0,
									45
								]
							},
							"x": -2.21,
							"z": 0.79,
							"scaleX": 50,
							"scaleY": 40,
							"scaleZ": 0.2,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
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
															"time": 0.15,
															"value": 1,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
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
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Apparition_Burst_Close_SandJet_L",
							"props": {
								"instScale_rand": 3,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									30
								],
								"lifeTimeRand": 0.2,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 12,
								"lifeTime": 3,
								"emitRad1": 0.73,
								"randomColor2": [
									0.6705882352941176,
									0.596078431372549,
									0.5568627450980392,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									3,
									1
								],
								"warmUpTime": -0.2,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitAngle": 200,
								"instRotation": [
									0,
									0,
									-45
								]
							},
							"x": -3.43,
							"z": 0.79,
							"scaleX": 50,
							"scaleY": 40,
							"scaleZ": 0.2,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
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
															"time": 0.15,
															"value": 1,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
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
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
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
								"threshold": 0.1,
								"useRGB": false
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "---------------------EndSmokeSand",
					"children": [
						{
							"type": "emitter",
							"name": "End_Infinity_Close_SandJet_L",
							"props": {
								"instScale_rand": 3,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									30
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 12,
								"lifeTime": 6,
								"emitRad1": 0.73,
								"randomColor2": [
									0.6705882352941176,
									0.596078431372549,
									0.5568627450980392,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 10,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									3,
									1
								],
								"warmUpTime": -0.2,
								"burstParticleCount": 20,
								"emitAngle": 200,
								"instRotation": [
									0,
									0,
									-45
								]
							},
							"x": -3.43,
							"y": -3.63,
							"z": -1.54,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 0.2,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.6
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
															"time": 0.15,
															"value": 1,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.3,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
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
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 4.469862542202774,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5.147108308048081,
											"value": 2,
											"mode": 2
										},
										{
											"time": 5.66955504170018,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "End_Infinity_Close_SandJet_R",
							"props": {
								"instScale_rand": 3,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									30
								],
								"lifeTimeRand": 1,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 12,
								"lifeTime": 6,
								"emitRad1": 0.73,
								"randomColor2": [
									0.6705882352941176,
									0.596078431372549,
									0.5568627450980392,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 10,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									3,
									1
								],
								"warmUpTime": -0.2,
								"burstParticleCount": 20,
								"emitAngle": 200,
								"instRotation": [
									0,
									0,
									45
								]
							},
							"x": -2.21,
							"y": 1.83,
							"z": -1.54,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 0.2,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.6
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
															"time": 0.15,
															"value": 1,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.3,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
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
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 4.531017715414907,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5.20826348126022,
											"value": 2,
											"mode": 2
										},
										{
											"time": 5.730710214912313,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "End_Burst_SandJet_R",
							"props": {
								"instScale_rand": 3,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									15
								],
								"lifeTimeRand": 0.2,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 15,
								"lifeTime": 3,
								"emitRad1": 0.3,
								"randomColor2": [
									0.6705882352941176,
									0.596078431372549,
									0.5568627450980392,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									2,
									1
								],
								"warmUpTime": -6.4,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitAngle": 200,
								"instRotation": [
									0,
									0,
									-15
								],
								"emitRad2": 0.8
							},
							"x": -2.21,
							"z": 0.79,
							"scaleX": 70.00000000000001,
							"scaleY": 70.00000000000001,
							"scaleZ": 0.2,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.3
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
															"time": 0.15,
															"value": 1,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
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
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "End_Burst_SandJet_L",
							"props": {
								"instScale_rand": 3,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									15
								],
								"lifeTimeRand": 0.2,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 15,
								"lifeTime": 3,
								"emitRad1": 0.3,
								"randomColor2": [
									0.6705882352941176,
									0.596078431372549,
									0.5568627450980392,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									2,
									1
								],
								"warmUpTime": -6.4,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitAngle": 200,
								"instRotation": [
									0,
									0,
									15
								],
								"emitRad2": 0.8
							},
							"x": -2.21,
							"z": 0.79,
							"scaleX": 70.00000000000001,
							"scaleY": 70.00000000000001,
							"scaleZ": 0.2,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.3
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
															"time": 0.15,
															"value": 1,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
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
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "End_NoAngle_Sanjet_Smooth",
							"props": {
								"instScale_rand": 3,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 0.2,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 15,
								"lifeTime": 3,
								"emitRad1": 0,
								"randomColor2": [
									0.6705882352941176,
									0.596078431372549,
									0.5568627450980392,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									2.5,
									1
								],
								"warmUpTime": -6.4,
								"emitType": "Burst",
								"burstParticleCount": 5,
								"emitRad2": 0.5
							},
							"x": -2.21,
							"z": 0.79,
							"scaleX": 30.000000000000007,
							"scaleY": 30.000000000000007,
							"scaleZ": 0.2,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.3
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
															"time": 0.15,
															"value": 1,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.7,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
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
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "End_NoAngle_Sanjet_Noisy",
							"props": {
								"instScale_rand": 3,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9529411764705882,
									0.9058823529411765,
									0.8823529411764706,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 0.2,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 15,
								"lifeTime": 3,
								"emitRad1": 0,
								"randomColor2": [
									0.6705882352941176,
									0.596078431372549,
									0.5568627450980392,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									2.5,
									1
								],
								"warmUpTime": -6.4,
								"emitType": "Burst",
								"burstParticleCount": 5,
								"emitRad2": 0.5,
								"seedGroup": 20
							},
							"x": -2.21,
							"z": 0.79,
							"scaleX": 30.000000000000007,
							"scaleY": 30.000000000000007,
							"scaleZ": 0.2,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.3
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
															"time": 0.15,
															"value": 1,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 0,
												"width": 0.2,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Noise_Grunge_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
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
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
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
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.3,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false
												}
											},
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.0632036648482905,
												"dt": -0.3641539145514759
											},
											"nextHandle": {
												"dv": 0.7116644418645992,
												"dt": 0.24506521910429008
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": -0.06222850653088885,
												"dt": -0.4213827940821647
											},
											"nextHandle": {
												"dv": 0.06222850653088885,
												"dt": 0.4213827940821647
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "tdecal",
					"name": "tdecal",
					"x": 1.33,
					"y": 3.44,
					"z": 5.35,
					"scaleX": 70,
					"scaleY": 70,
					"scaleZ": 20,
					"albedoMap": "Structure/Resources/Decals/DirtDecal_1_color.png",
					"albedoStrength": 0.79,
					"normalStrength": 0,
					"pbrStrength": 0
				},
				{
					"type": "subFX",
					"name": "FX_Directional_Explosion_High",
					"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
					"x": -2.85962,
					"y": -3.51139,
					"z": -5.72739,
					"scaleX": 5.5,
					"scaleY": 5.5,
					"scaleZ": 5.5,
					"time": 5.11681
				},
				{
					"type": "subFX",
					"name": "FX_WormHarvester_Explosion_Impact",
					"source": "Fx/Unit/FX_WormHarvester_Explosion_Impact.fx",
					"x": 0.55538,
					"y": -3.25767,
					"z": -7.32929,
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 5,
					"time": 2.97
				},
				{
					"type": "emitter",
					"name": "Impact_Burst_Close_SandJet_R_VIOLET",
					"props": {
						"instScale_rand": 2,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.592156862745098,
							0.24705882352941178,
							0.3529411764705882,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							45
						],
						"lifeTimeRand": 0.2,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 12,
						"lifeTime": 2,
						"emitRad1": 0.73,
						"randomColor2": [
							0.4,
							0.24705882352941178,
							0.592156862745098,
							1
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"instStretch_rand": [
							0,
							0.25,
							0
						],
						"instStretch": [
							1,
							4.3,
							1
						],
						"warmUpTime": -4.5,
						"emitType": "Burst",
						"burstParticleCount": 20,
						"emitAngle": 150,
						"instRotation": [
							0,
							0,
							45
						],
						"useRandomColor": true
					},
					"z": -2.98373,
					"scaleX": 10.000000000000002,
					"scaleY": 10.000000000000002,
					"scaleZ": 0.2,
					"rotationZ": 90,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"drawOrder": "100"
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
									]
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.7
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
													"time": 0.15,
													"value": 1,
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
										"amount": 0.9,
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
										"progress": 0.58,
										"saturation": 0,
										"width": 0.5,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.02
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
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
													}
												},
												{
													"time": 1.5,
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
										"range": 3,
										"power": 0.5
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.3,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.2,
									"envBlend": 0.6
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Impact_Burst_Close_SandJet_L_VIOLET",
					"props": {
						"instScale_rand": 2,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.592156862745098,
							0.24705882352941178,
							0.3529411764705882,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							45
						],
						"lifeTimeRand": 0.2,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 12,
						"lifeTime": 2,
						"emitRad1": 0.73,
						"randomColor2": [
							0.4,
							0.24705882352941178,
							0.592156862745098,
							1
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"emitRate": 20,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"instStretch_rand": [
							0,
							0.25,
							0
						],
						"instStretch": [
							1,
							4.3,
							1
						],
						"warmUpTime": -4.5,
						"emitType": "Burst",
						"burstParticleCount": 20,
						"emitAngle": 150,
						"instRotation": [
							0,
							0,
							-45
						],
						"useRandomColor": true
					},
					"z": -2.98373,
					"scaleX": 10.000000000000002,
					"scaleY": 10.000000000000002,
					"scaleZ": 0.2,
					"rotationZ": -90,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"drawOrder": "100"
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
									]
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.7
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
													"time": 0.15,
													"value": 1,
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
										"amount": 0.9,
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
										"progress": 0.58,
										"saturation": 0,
										"width": 0.5,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.02
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
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1946815774171073,
														"dt": -0.37422467067608545
													},
													"nextHandle": {
														"dv": -1.0693652343750002,
														"dt": 0.3379705070727756
													}
												},
												{
													"time": 1.5,
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
										"range": 3,
										"power": 0.5
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.3,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.2,
									"envBlend": 0.6
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Cloud_Sand_Violet",
					"props": {
						"instScale_rand": 5,
						"maxCount": 50,
						"simulationSpace": "World",
						"animationSpeed": 0.3,
						"randomColor1": [
							0.5882352941176471,
							0.2588235294117647,
							0.5764705882352941,
							1
						],
						"randomColor2": [
							0.4,
							0.24705882352941178,
							0.592156862745098,
							1
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
						"lifeTime": 7,
						"emitType": "Burst",
						"burstParticleCount": 6,
						"emitOrientation": "Normal",
						"emitShape": "Cylinder",
						"emitRad1": 0.73,
						"emitRad2": 0.73,
						"emitSurface": true,
						"instScale": 60,
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
						"lifeTimeRand": 2,
						"instStretch_rand": [
							0,
							0,
							0
						],
						"instAcceleration_rand": [
							0,
							0,
							0.05
						],
						"instAcceleration": [
							0,
							0,
							-0.1
						],
						"alignMode": "Screen",
						"useRandomColor": true,
						"warmUpTime": -4.5
					},
					"x": -3.67386,
					"y": -2.37576,
					"z": 11.01451,
					"scaleX": 30,
					"scaleY": 30,
					"scaleZ": 10,
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
											"textureWrap": true,
											"drawOrder": "120"
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
										"scale": 1
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.106716002441871,
														"dt": -0.6821153640926553
													},
													"nextHandle": {
														"dv": 0.5801666666666667,
														"dt": 0.1877523574176082
													}
												},
												{
													"time": 0.45720523661786744,
													"value": 0.934712962962963,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": false,
										"progress": 0.7,
										"saturation": 0,
										"width": 0.8,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
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
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 10,
										"power": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.9,
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
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.6,
										"envColorSet": false
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
				}
			]
		}
	]
}