{
	"type": "fx",
	"duration": 20,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 0.3999999999999999,
			"scaleX": 0.5,
			"scaleY": 0.5,
			"scaleZ": 0.5,
			"children": [
				{
					"type": "object",
					"name": "Units",
					"editorOnly": true,
					"x": -1.5599999999999998,
					"y": -1.04,
					"z": -0.7999999999999998,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "model",
							"name": "Male01_AtreideSoldier",
							"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
							"x": -1.5,
							"y": -1.5,
							"scaleX": 1.84,
							"scaleY": 1.84,
							"scaleZ": 1.84,
							"rotationZ": 89.99999999999999
						},
						{
							"type": "model",
							"name": "Male01_AtreideSoldier",
							"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
							"x": 1.5,
							"y": -1.5,
							"scaleX": 1.84,
							"scaleY": 1.84,
							"scaleZ": 1.84,
							"rotationZ": 89.99999999999999
						},
						{
							"type": "model",
							"name": "Male01_AtreideSoldier",
							"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
							"x": 1.5,
							"y": 1.5,
							"scaleX": 1.84,
							"scaleY": 1.84,
							"scaleZ": 1.84,
							"rotationZ": 89.99999999999999
						},
						{
							"type": "model",
							"name": "Male01_AtreideSoldier",
							"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
							"x": -1.5,
							"y": 1.5,
							"scaleX": 1.84,
							"scaleY": 1.84,
							"scaleZ": 1.84,
							"rotationZ": 89.99999999999999
						}
					]
				},
				{
					"type": "polygon",
					"name": "polygon",
					"editorOnly": true,
					"z": 0.44000000000000017,
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
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Character/Creatures/Sandworm/Anim_Sandworm_UnitDestruction.fbx",
									"speed": 0.7,
									"duration": 15
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
													"time": 5.301990965100124,
													"value": 1,
													"mode": 2
												},
												{
													"time": 6.751546306610111,
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
													"time": 5.758645484306619,
													"value": 1,
													"mode": 2
												},
												{
													"time": 7.895788634193017,
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
													"time": 5.301990965100124,
													"value": 1,
													"mode": 2
												},
												{
													"time": 6.751546306610111,
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
													"time": 5.484652772782722,
													"value": 1,
													"mode": 2
												},
												{
													"time": 7.767925368815198,
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
													"time": 5.301990965100124,
													"value": 1,
													"mode": 2
												},
												{
													"time": 6.751546306610111,
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
													"time": 5.301990965100124,
													"value": 0.9838888888888889,
													"mode": 2
												},
												{
													"time": 7.676594464973899,
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
													"time": 2.6162163196711092,
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
													"time": 4.949155599383328,
													"value": 0.9666666666666667,
													"mode": 2
												},
												{
													"time": 6.763663928048388,
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
					"z": 1.93802,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "model",
							"name": "FX_Mesh_Disc_Wave",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
							"x": -0.25,
							"y": 0.23,
							"z": -0.9,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.6,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
													"time": 7.92151126020142,
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
													"time": 11.097636957966447,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03331288427669987,
														"dt": -1.631794374101906
													},
													"nextHandle": {
														"dv": 0.005418900361398122,
														"dt": 0.33443212785445353
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
													"time": 8.55211355811584,
													"value": 0.9666666666666667,
													"mode": 2
												},
												{
													"time": 11.039119178659536,
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
									"enabled": false,
									"props": {
										"X": false,
										"Y": false,
										"Z": true,
										"tex": "Fx/DistortionMaps/waveNormal02.jpg",
										"intensity": 1,
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
													"time": 5.392153475542675,
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
													"time": 6.42307780975207,
													"value": 0.9752662892820968,
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
													"time": 6.751869063580746,
													"value": 0.935757442454181,
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
													"time": 8.005385718802573,
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
													"time": 11.889232404653816,
													"value": 1.262802896751929,
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.56,
										"sandColorSet": false,
										"envBlend": 0.6,
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
										"range": 5,
										"power": 0.8
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "FX_Mesh_Disc_Wave",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
							"x": -0.25,
							"y": 0.23,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 90,
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
										"range": 5,
										"power": 0.8
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
													"time": 8.581372447769295,
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
													"time": 11.097636957966447,
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
													"time": 8.55211355811584,
													"value": 0.9666666666666667,
													"mode": 2
												},
												{
													"time": 11.039119178659536,
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
										"sandBlend": 0.4,
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
									"enabled": false,
									"props": {
										"X": false,
										"Y": false,
										"Z": true,
										"tex": "Fx/DistortionMaps/waveNormal02.jpg",
										"intensity": 1,
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
													"time": 5.392153475542675,
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
													"time": 6.626271130492124,
													"value": 0.9752662892820968,
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
													"time": 6.90026384201602,
													"value": 0.8299362371856998,
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
													"time": 8.281925998972214,
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
													"time": 11.94797343851999,
													"value": 1.549516188896967,
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
							"x": -0.86,
							"y": 0.62,
							"z": 2,
							"scaleX": 45,
							"scaleY": 45,
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
											"drawOrder": "100"
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
													"time": 9.447380716318504,
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
													"time": 11.475997065624734,
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
										"range": 5,
										"power": 0.8
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
											"time": 11.54952425372536,
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
											"time": 10.48865872379377,
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
											"time": 11.528974800361068,
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
							"x": -0.38,
							"y": 0.63,
							"z": 2,
							"scaleX": 20,
							"scaleY": 20,
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
										"alpha": 0.7,
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
													"time": 8.858053264156526,
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
													"time": 10.886669613462756,
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
								"lifeTime": 5,
								"emitRad1": 0.64,
								"emitRad2": 0.8,
								"animationSpeed": 0.1,
								"instStretch_rand": [
									0.1,
									0.1,
									0.1
								],
								"emitType": "Burst",
								"burstCount": 12,
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
								],
								"emitAngle": 360
							},
							"x": -0.69,
							"y": -0.95,
							"z": 2.49,
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
												"width": 0.2,
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
					"name": "-------------------------------Impact",
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
								"lifeTime": 2.5,
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -6.6,
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale": 1.8
							},
							"z": 0.7450000000000001,
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
												"intensity": 0.035
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
					"name": "ShockWave",
					"props": {
						"warmUpTime": -6.6,
						"emitType": "Burst",
						"instScale": 270
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
										"range": 1.5,
										"power": 0.8
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
					"type": "object",
					"name": "Sand",
					"x": -1.8750000000000002,
					"y": -0.14333333333333334,
					"z": 1.3322222222222226,
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
							"x": -1.555,
							"y": -3.4866666666666664,
							"z": -2.8722222222222227,
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
													"enableStencil": false,
													"drawOrder": "110"
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
											"time": 6.712054497687431,
											"value": 0,
											"mode": 2
										},
										{
											"time": 7.622331064683816,
											"value": 2,
											"mode": 2
										},
										{
											"time": 8.32454441636674,
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
							"x": -0.33499999999999974,
							"y": 1.9733333333333334,
							"z": -2.8722222222222227,
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
													"enableStencil": false,
													"drawOrder": "110"
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
											"time": 6.712054497687431,
											"value": 0,
											"mode": 2
										},
										{
											"time": 7.622331064683816,
											"value": 2,
											"mode": 2
										},
										{
											"time": 8.32454441636674,
											"value": 0,
											"mode": 2
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
								"warmUpTime": -6.78,
								"emitType": "Burst",
								"burstParticleCount": 35,
								"emitAngle": 200,
								"instRotation": [
									0,
									0,
									-30
								]
							},
							"x": -0.33499999999999974,
							"y": 0.14333333333333334,
							"z": -0.5422222222222226,
							"scaleX": 100.00000000000003,
							"scaleY": 100.00000000000003,
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
								"warmUpTime": -6.78,
								"emitType": "Burst",
								"burstParticleCount": 35,
								"emitAngle": 200,
								"instRotation": [
									0,
									0,
									30
								]
							},
							"x": -0.33499999999999974,
							"y": 0.14333333333333334,
							"z": -0.5422222222222226,
							"scaleX": 100.00000000000003,
							"scaleY": 100.00000000000003,
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
													"enableStencil": false,
													"drawOrder": "110"
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
								"warmUpTime": -8.9,
								"emitType": "Burst",
								"burstParticleCount": 5,
								"emitRad2": 0.5,
								"seedGroup": 20,
								"emitAngle": 360
							},
							"x": -0.33499999999999974,
							"y": 0.14333333333333334,
							"z": -0.5422222222222226,
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
													"enableStencil": false,
													"drawOrder": "110"
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
								"warmUpTime": -8.9,
								"emitType": "Burst",
								"burstParticleCount": 5,
								"emitRad2": 0.5,
								"emitAngle": 360
							},
							"x": -0.33499999999999974,
							"y": 0.14333333333333334,
							"z": -0.5422222222222226,
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
								"warmUpTime": -8.9,
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
							"x": -0.33499999999999974,
							"y": 0.14333333333333334,
							"z": -0.5422222222222226,
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
													"enableStencil": false,
													"drawOrder": "110"
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
								"warmUpTime": -8.9,
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
							"x": -0.33499999999999974,
							"y": 0.14333333333333334,
							"z": -0.5422222222222226,
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
													"enableStencil": false,
													"drawOrder": "110"
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
							"x": -1.555,
							"y": 0.14333333333333334,
							"z": -0.5422222222222226,
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
													"enableStencil": false,
													"drawOrder": "110"
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
							"x": -0.33499999999999974,
							"y": 0.14333333333333334,
							"z": -0.5422222222222226,
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
													"enableStencil": false,
													"drawOrder": "110"
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
								"warmUpTime": -6.63,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitAngle": 200,
								"instRotation": [
									0,
									0,
									-45
								]
							},
							"x": -0.33499999999999974,
							"y": 0.14333333333333334,
							"z": -0.5422222222222226,
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
													"enableStencil": false,
													"drawOrder": "110"
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
								"warmUpTime": -6.63,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitAngle": 200,
								"instRotation": [
									0,
									0,
									45
								]
							},
							"x": -0.33499999999999974,
							"y": 0.14333333333333334,
							"z": -0.5422222222222226,
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
													"enableStencil": false,
													"drawOrder": "110"
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
								"warmUpTime": -6.45,
								"emitType": "Burst",
								"burstParticleCount": 13
							},
							"x": 0.7650000000000001,
							"y": -0.6366666666666667,
							"z": 8.437777777777779,
							"scaleX": 25,
							"scaleY": 25,
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
													"enableStencil": false,
													"drawOrder": "110"
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
							"x": -0.33499999999999974,
							"y": 0.14333333333333334,
							"z": -0.5422222222222226,
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
													"enableStencil": false,
													"drawOrder": "110"
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
							"x": -1.555,
							"y": 0.14333333333333334,
							"z": -0.5422222222222226,
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
													"enableStencil": false,
													"drawOrder": "110"
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
								],
								"emitAngle": 360
							},
							"x": 2.8550000000000004,
							"y": 0.14333333333333334,
							"z": 1.4377777777777774,
							"scaleX": 20,
							"scaleY": 20,
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
													"enableStencil": false,
													"drawOrder": "110"
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
								],
								"emitAngle": 360
							},
							"x": 2.8550000000000004,
							"y": 0.14333333333333334,
							"z": 1.4377777777777774,
							"scaleX": 60,
							"scaleY": 60,
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
													"enableStencil": false,
													"drawOrder": "110"
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
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 5,
								"power": 0.8
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
							"topIntensity": 0.4,
							"topSpan": 0.3,
							"dirIntensity": 0.1,
							"dirSpan": 0,
							"sandBlend": 0.7,
							"envBlend": 0.7
						}
					]
				}
			]
		}
	]
}