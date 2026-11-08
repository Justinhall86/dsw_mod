{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Overlord",
					"source": "Vehicle/Harkonnen/Overlord/Overlord.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Hawk/Anim_Hawk_Idle.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Lights",
					"z": 3.50865,
					"rotationZ": 90,
					"children": [
						{
							"type": "object",
							"name": "TopRow",
							"x": 1.0924699999999998,
							"y": -0.002606666666666653,
							"z": 0.5313266666666663,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV_01",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_Double_larger.fbx",
									"x": -0.05772999999999984,
									"y": -1.5216533333333335,
									"z": -0.30757666666666594,
									"scaleX": 4.5,
									"scaleY": 4.500000000000001,
									"scaleZ": 27,
									"rotationX": 74.01189023397752,
									"rotationY": 2.552424328812825,
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
													"emissive": 1
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
												"invert": true,
												"replace": false,
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"onDecal": false
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
												"progress": 0.95,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
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
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.y",
											"loop": true,
											"keys": [
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0
												},
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.19428162574768085
													}
												},
												{
													"time": 4,
													"value": 0.06819444444444442,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0024737654320987623,
														"dt": -1.6599356297314154
													},
													"nextHandle": {
														"dv": -0.00397550635785093,
														"dt": 2.6691006001033157
													}
												},
												{
													"time": 12,
													"value": -0.08023148148148147,
													"mode": 0,
													"prevHandle": {
														"dv": 0.003978062216761289,
														"dt": -3.6056023679098437
													},
													"nextHandle": {
														"dv": -0.004122942386831294,
														"dt": 3.7455149174821436
													}
												},
												{
													"time": 20,
													"value": 0.06541666666666664,
													"mode": 0,
													"prevHandle": {
														"dv": 9.883804764929432e-18,
														"dt": -3.483375322487795
													},
													"nextHandle": {
														"dv": 0.000029149519890261932,
														"dt": 2.448240191088921
													}
												},
												{
													"time": 28,
													"value": -0.07980573449683236,
													"mode": 0,
													"prevHandle": {
														"dv": 9.866112861262372e-18,
														"dt": -3.477140118322255
													},
													"nextHandle": {
														"dv": -0.00042574698464913074,
														"dt": 2.633869286290121
													}
												},
												{
													"time": 32,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderCone_StraightUV_01",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_Double_larger.fbx",
									"x": -0.05772999999999984,
									"y": 1.5268666666666666,
									"z": -0.30757666666666594,
									"scaleX": 4.5,
									"scaleY": 4.500000000000001,
									"scaleZ": 27,
									"rotationX": -62.18810976602245,
									"rotationY": 2.552424328812826,
									"rotationZ": -1.9898207917439837e-16,
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
													"emissive": 1
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
												"invert": true,
												"replace": false,
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"onDecal": false
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
												"progress": 0.95,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
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
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.y",
											"loop": true,
											"keys": [
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0
												},
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.19428162574768085
													}
												},
												{
													"time": 4,
													"value": 0.06819444444444442,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0024737654320987623,
														"dt": -1.6599356297314154
													},
													"nextHandle": {
														"dv": -0.00397550635785093,
														"dt": 2.6691006001033157
													}
												},
												{
													"time": 12,
													"value": -0.08023148148148147,
													"mode": 0,
													"prevHandle": {
														"dv": 0.003978062216761289,
														"dt": -3.6056023679098437
													},
													"nextHandle": {
														"dv": -0.004122942386831294,
														"dt": 3.7455149174821436
													}
												},
												{
													"time": 20,
													"value": 0.06541666666666664,
													"mode": 0,
													"prevHandle": {
														"dv": 9.883804764929432e-18,
														"dt": -3.483375322487795
													},
													"nextHandle": {
														"dv": 0.000029149519890261932,
														"dt": 2.448240191088921
													}
												},
												{
													"time": 28,
													"value": -0.07980573449683236,
													"mode": 0,
													"prevHandle": {
														"dv": 9.866112861262372e-18,
														"dt": -3.477140118322255
													},
													"nextHandle": {
														"dv": -0.00042574698464913074,
														"dt": 2.633869286290121
													}
												},
												{
													"time": 32,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderCone_StraightUV_01",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_Double_larger.fbx",
									"x": 0.11546000000000012,
									"y": -0.005213333333333348,
									"z": 0.6151533333333337,
									"scaleX": 4.5,
									"scaleY": 4.5,
									"scaleZ": 27,
									"rotationX": 5.91189023397754,
									"rotationY": 2.5524243288128257,
									"rotationZ": -2.4872759896801996e-17,
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
													"emissive": 1
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
												"invert": true,
												"replace": false,
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"onDecal": false
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
												"progress": 0.95,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
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
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.y",
											"loop": true,
											"keys": [
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0
												},
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.19428162574768085
													}
												},
												{
													"time": 4,
													"value": 0.06819444444444442,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0024737654320987623,
														"dt": -1.6599356297314154
													},
													"nextHandle": {
														"dv": -0.00397550635785093,
														"dt": 2.6691006001033157
													}
												},
												{
													"time": 12,
													"value": -0.08023148148148147,
													"mode": 0,
													"prevHandle": {
														"dv": 0.003978062216761289,
														"dt": -3.6056023679098437
													},
													"nextHandle": {
														"dv": -0.004122942386831294,
														"dt": 3.7455149174821436
													}
												},
												{
													"time": 20,
													"value": 0.06541666666666664,
													"mode": 0,
													"prevHandle": {
														"dv": 9.883804764929432e-18,
														"dt": -3.483375322487795
													},
													"nextHandle": {
														"dv": 0.000029149519890261932,
														"dt": 2.448240191088921
													}
												},
												{
													"time": 28,
													"value": -0.07980573449683236,
													"mode": 0,
													"prevHandle": {
														"dv": 9.866112861262372e-18,
														"dt": -3.477140118322255
													},
													"nextHandle": {
														"dv": -0.00042574698464913074,
														"dt": 2.633869286290121
													}
												},
												{
													"time": 32,
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
							"type": "object",
							"name": "BottomRow",
							"x": -0.3525,
							"y": -0.00261,
							"z": 0.53133,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV_01",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_Double_larger.fbx",
									"x": 0.15088,
									"y": -1.41602,
									"z": -0.25623,
									"scaleX": 4.5,
									"scaleY": 4.500000000000001,
									"scaleZ": 27,
									"rotationX": 68.7,
									"rotationY": -36,
									"rotationZ": -15,
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
													"emissive": 1
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
												"invert": true,
												"replace": false,
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"onDecal": false
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
												"progress": 0.95,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
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
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.y",
											"loop": true,
											"keys": [
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0
												},
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.19428162574768085
													}
												},
												{
													"time": 4,
													"value": 0.06819444444444442,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0024737654320987623,
														"dt": -1.6599356297314154
													},
													"nextHandle": {
														"dv": -0.00397550635785093,
														"dt": 2.6691006001033157
													}
												},
												{
													"time": 12,
													"value": -0.08023148148148147,
													"mode": 0,
													"prevHandle": {
														"dv": 0.003978062216761289,
														"dt": -3.6056023679098437
													},
													"nextHandle": {
														"dv": -0.004122942386831294,
														"dt": 3.7455149174821436
													}
												},
												{
													"time": 20,
													"value": 0.06541666666666664,
													"mode": 0,
													"prevHandle": {
														"dv": 9.883804764929432e-18,
														"dt": -3.483375322487795
													},
													"nextHandle": {
														"dv": 0.000029149519890261932,
														"dt": 2.448240191088921
													}
												},
												{
													"time": 28,
													"value": -0.07980573449683236,
													"mode": 0,
													"prevHandle": {
														"dv": 9.866112861262372e-18,
														"dt": -3.477140118322255
													},
													"nextHandle": {
														"dv": -0.00042574698464913074,
														"dt": 2.633869286290121
													}
												},
												{
													"time": 32,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderCone_StraightUV_01",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_Double_larger.fbx",
									"x": 0.15088,
									"y": 1.41602,
									"z": -0.25623,
									"scaleX": 4.5,
									"scaleY": 4.500000000000001,
									"scaleZ": 27,
									"rotationX": -68.7,
									"rotationY": -36,
									"rotationZ": 15,
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
													"emissive": 1
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
												"invert": true,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"onDecal": false
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
												"progress": 0.95,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
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
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.y",
											"loop": true,
											"keys": [
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0
												},
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.19428162574768085
													}
												},
												{
													"time": 4,
													"value": 0.06819444444444442,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0024737654320987623,
														"dt": -1.6599356297314154
													},
													"nextHandle": {
														"dv": -0.00397550635785093,
														"dt": 2.6691006001033157
													}
												},
												{
													"time": 12,
													"value": -0.08023148148148147,
													"mode": 0,
													"prevHandle": {
														"dv": 0.003978062216761289,
														"dt": -3.6056023679098437
													},
													"nextHandle": {
														"dv": -0.004122942386831294,
														"dt": 3.7455149174821436
													}
												},
												{
													"time": 20,
													"value": 0.06541666666666664,
													"mode": 0,
													"prevHandle": {
														"dv": 9.883804764929432e-18,
														"dt": -3.483375322487795
													},
													"nextHandle": {
														"dv": 0.000029149519890261932,
														"dt": 2.448240191088921
													}
												},
												{
													"time": 28,
													"value": -0.07980573449683236,
													"mode": 0,
													"prevHandle": {
														"dv": 9.866112861262372e-18,
														"dt": -3.477140118322255
													},
													"nextHandle": {
														"dv": -0.00042574698464913074,
														"dt": 2.633869286290121
													}
												},
												{
													"time": 32,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderCone_StraightUV_01",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_Double_larger.fbx",
									"x": 0.09385,
									"y": -0.00521,
									"z": 0.55214,
									"scaleX": 4.5,
									"scaleY": 4.5,
									"scaleZ": 27,
									"rotationY": -30,
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
													"emissive": 1
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
												"invert": true,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"onDecal": false
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
												"progress": 0.95,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
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
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.y",
											"loop": true,
											"keys": [
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0
												},
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.19428162574768085
													}
												},
												{
													"time": 4,
													"value": 0.06819444444444442,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0024737654320987623,
														"dt": -1.6599356297314154
													},
													"nextHandle": {
														"dv": -0.00397550635785093,
														"dt": 2.6691006001033157
													}
												},
												{
													"time": 12,
													"value": -0.08023148148148147,
													"mode": 0,
													"prevHandle": {
														"dv": 0.003978062216761289,
														"dt": -3.6056023679098437
													},
													"nextHandle": {
														"dv": -0.004122942386831294,
														"dt": 3.7455149174821436
													}
												},
												{
													"time": 20,
													"value": 0.06541666666666664,
													"mode": 0,
													"prevHandle": {
														"dv": 9.883804764929432e-18,
														"dt": -3.483375322487795
													},
													"nextHandle": {
														"dv": 0.000029149519890261932,
														"dt": 2.448240191088921
													}
												},
												{
													"time": 28,
													"value": -0.07980573449683236,
													"mode": 0,
													"prevHandle": {
														"dv": 9.866112861262372e-18,
														"dt": -3.477140118322255
													},
													"nextHandle": {
														"dv": -0.00042574698464913074,
														"dt": 2.633869286290121
													}
												},
												{
													"time": 32,
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
							"type": "object",
							"name": "MidRow",
							"x": 0.27942,
							"y": -0.00261,
							"z": 0.53133,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV_01",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_Double_larger.fbx",
									"x": 0.01862,
									"y": 1.67809,
									"z": -1.23591,
									"scaleX": 4.5,
									"scaleY": 4.500000000000001,
									"scaleZ": 27,
									"rotationX": -92.4,
									"rotationY": 2.6,
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
													"emissive": 1
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
												"invert": true,
												"replace": false,
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"onDecal": false
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
												"progress": 0.95,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
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
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.y",
											"loop": true,
											"keys": [
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0
												},
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.19428162574768085
													}
												},
												{
													"time": 4,
													"value": 0.06819444444444442,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0024737654320987623,
														"dt": -1.6599356297314154
													},
													"nextHandle": {
														"dv": -0.00397550635785093,
														"dt": 2.6691006001033157
													}
												},
												{
													"time": 12,
													"value": -0.08023148148148147,
													"mode": 0,
													"prevHandle": {
														"dv": 0.003978062216761289,
														"dt": -3.6056023679098437
													},
													"nextHandle": {
														"dv": -0.004122942386831294,
														"dt": 3.7455149174821436
													}
												},
												{
													"time": 20,
													"value": 0.06541666666666664,
													"mode": 0,
													"prevHandle": {
														"dv": 9.883804764929432e-18,
														"dt": -3.483375322487795
													},
													"nextHandle": {
														"dv": 0.000029149519890261932,
														"dt": 2.448240191088921
													}
												},
												{
													"time": 28,
													"value": -0.07980573449683236,
													"mode": 0,
													"prevHandle": {
														"dv": 9.866112861262372e-18,
														"dt": -3.477140118322255
													},
													"nextHandle": {
														"dv": -0.00042574698464913074,
														"dt": 2.633869286290121
													}
												},
												{
													"time": 32,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderCone_StraightUV_01",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_Double_larger.fbx",
									"x": 0.01862,
									"y": -1.67809,
									"z": -1.23591,
									"scaleX": 4.5,
									"scaleY": 4.500000000000001,
									"scaleZ": 27,
									"rotationX": 92.4,
									"rotationY": 2.6,
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
													"emissive": 1
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
												"invert": true,
												"replace": false,
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"onDecal": false
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
												"progress": 0.95,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
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
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.y",
											"loop": true,
											"keys": [
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0
												},
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.19428162574768085
													}
												},
												{
													"time": 4,
													"value": 0.06819444444444442,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0024737654320987623,
														"dt": -1.6599356297314154
													},
													"nextHandle": {
														"dv": -0.00397550635785093,
														"dt": 2.6691006001033157
													}
												},
												{
													"time": 12,
													"value": -0.08023148148148147,
													"mode": 0,
													"prevHandle": {
														"dv": 0.003978062216761289,
														"dt": -3.6056023679098437
													},
													"nextHandle": {
														"dv": -0.004122942386831294,
														"dt": 3.7455149174821436
													}
												},
												{
													"time": 20,
													"value": 0.06541666666666664,
													"mode": 0,
													"prevHandle": {
														"dv": 9.883804764929432e-18,
														"dt": -3.483375322487795
													},
													"nextHandle": {
														"dv": 0.000029149519890261932,
														"dt": 2.448240191088921
													}
												},
												{
													"time": 28,
													"value": -0.07980573449683236,
													"mode": 0,
													"prevHandle": {
														"dv": 9.866112861262372e-18,
														"dt": -3.477140118322255
													},
													"nextHandle": {
														"dv": -0.00042574698464913074,
														"dt": 2.633869286290121
													}
												},
												{
													"time": 32,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderCone_StraightUV_01",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_Double_larger.fbx",
									"x": 0.10364,
									"y": -0.96676,
									"z": 0.35292,
									"scaleX": 4.5,
									"scaleY": 4.5,
									"scaleZ": 27,
									"rotationX": 26.3,
									"rotationY": 2.6,
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
													"emissive": 1
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
												"invert": true,
												"replace": false,
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"onDecal": false
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
												"progress": 0.95,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
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
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.y",
											"loop": true,
											"keys": [
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0
												},
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.19428162574768085
													}
												},
												{
													"time": 4,
													"value": 0.06819444444444442,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0024737654320987623,
														"dt": -1.6599356297314154
													},
													"nextHandle": {
														"dv": -0.00397550635785093,
														"dt": 2.6691006001033157
													}
												},
												{
													"time": 12,
													"value": -0.08023148148148147,
													"mode": 0,
													"prevHandle": {
														"dv": 0.003978062216761289,
														"dt": -3.6056023679098437
													},
													"nextHandle": {
														"dv": -0.004122942386831294,
														"dt": 3.7455149174821436
													}
												},
												{
													"time": 20,
													"value": 0.06541666666666664,
													"mode": 0,
													"prevHandle": {
														"dv": 9.883804764929432e-18,
														"dt": -3.483375322487795
													},
													"nextHandle": {
														"dv": 0.000029149519890261932,
														"dt": 2.448240191088921
													}
												},
												{
													"time": 28,
													"value": -0.07980573449683236,
													"mode": 0,
													"prevHandle": {
														"dv": 9.866112861262372e-18,
														"dt": -3.477140118322255
													},
													"nextHandle": {
														"dv": -0.00042574698464913074,
														"dt": 2.633869286290121
													}
												},
												{
													"time": 32,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderCone_StraightUV_01",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_Double_larger.fbx",
									"x": 0.10364,
									"y": 0.96676,
									"z": 0.35292,
									"scaleX": 4.5,
									"scaleY": 4.5,
									"scaleZ": 27,
									"rotationX": -26.3,
									"rotationY": 2.6,
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
													"emissive": 1
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
												"invert": true,
												"replace": false,
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"onDecal": false
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
												"progress": 0.95,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
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
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.y",
											"loop": true,
											"keys": [
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0
												},
												{
													"time": -3.552713678800501e-15,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.19428162574768085
													}
												},
												{
													"time": 4,
													"value": 0.06819444444444442,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0024737654320987623,
														"dt": -1.6599356297314154
													},
													"nextHandle": {
														"dv": -0.00397550635785093,
														"dt": 2.6691006001033157
													}
												},
												{
													"time": 12,
													"value": -0.08023148148148147,
													"mode": 0,
													"prevHandle": {
														"dv": 0.003978062216761289,
														"dt": -3.6056023679098437
													},
													"nextHandle": {
														"dv": -0.004122942386831294,
														"dt": 3.7455149174821436
													}
												},
												{
													"time": 20,
													"value": 0.06541666666666664,
													"mode": 0,
													"prevHandle": {
														"dv": 9.883804764929432e-18,
														"dt": -3.483375322487795
													},
													"nextHandle": {
														"dv": 0.000029149519890261932,
														"dt": 2.448240191088921
													}
												},
												{
													"time": 28,
													"value": -0.07980573449683236,
													"mode": 0,
													"prevHandle": {
														"dv": 9.866112861262372e-18,
														"dt": -3.477140118322255
													},
													"nextHandle": {
														"dv": -0.00042574698464913074,
														"dt": 2.633869286290121
													}
												},
												{
													"time": 32,
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
							"type": "advancedDecal",
							"name": "advancedDecal",
							"enabled": false,
							"x": 0.93266,
							"z": 0.85864,
							"scaleX": 3,
							"scaleY": 5,
							"scaleZ": 3,
							"albedoMap": "Fx/Gradients/circGrad02.jpg",
							"albedoStrength": 0.25,
							"emissive": 2,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0,
											0
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Reactor",
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"rotationX": 90,
					"rotationY": -90,
					"children": [
						{
							"type": "object",
							"name": "Reactor_RF",
							"x": 0.36107,
							"y": 0.49216,
							"z": 1.32472,
							"scaleX": 1.5,
							"scaleY": 1.23,
							"scaleZ": 0.99,
							"rotationX": -2.5,
							"rotationY": 46.9,
							"rotationZ": -28.9,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 0.15000000000000005,
									"scaleY": 0.15000000000000002,
									"scaleZ": 0.30000000000000004,
									"rotationX": -1.542772070128081e-25,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 1.8
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													3,
													2
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.3529411764705882,
													0.9921568627450981
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Reactor_Big",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 0.25000000000000006,
									"scaleY": 0.25,
									"scaleZ": 0.40000000000000013,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.6,
												"uvScaleY": 0.6,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1.5,
													1
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.00784313725490196,
													0.2,
													0.5568627450980392
												]
											},
											"isInstance": true
										},
										{
											"type": "object",
											"name": "group"
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Reactor_LF",
							"x": 0.35738,
							"y": -0.48239,
							"z": 1.31803,
							"scaleX": 1.5,
							"scaleY": 1.23,
							"scaleZ": 0.99,
							"rotationX": 34.2,
							"rotationY": 43.3,
							"rotationZ": 30.2,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 0.15000000000000005,
									"scaleY": 0.15000000000000002,
									"scaleZ": 0.30000000000000004,
									"rotationX": -1.542772070128081e-25,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 1.8
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													3,
													2
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.3529411764705882,
													0.9921568627450981
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Reactor_Big",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 0.25000000000000006,
									"scaleY": 0.25,
									"scaleZ": 0.40000000000000013,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.6,
												"uvScaleY": 0.6,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1.5,
													1
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.00784313725490196,
													0.2,
													0.5568627450980392
												]
											},
											"isInstance": true
										},
										{
											"type": "object",
											"name": "group"
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Reactor_RM",
							"x": -0.72178,
							"y": 0.4957,
							"z": 1.31246,
							"scaleX": 1.75,
							"scaleY": 1.23,
							"scaleZ": 0.99,
							"rotationX": -9,
							"rotationY": 46.3,
							"rotationZ": -37.9,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 0.15000000000000005,
									"scaleY": 0.15000000000000002,
									"scaleZ": 0.30000000000000004,
									"rotationX": -1.542772070128081e-25,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 1.8
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													3,
													2
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.3529411764705882,
													0.9921568627450981
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Reactor_Big",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 0.25000000000000006,
									"scaleY": 0.25,
									"scaleZ": 0.40000000000000013,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.6,
												"uvScaleY": 0.6,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1.5,
													1
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.00784313725490196,
													0.2,
													0.5568627450980392
												]
											},
											"isInstance": true
										},
										{
											"type": "object",
											"name": "group"
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Reactor_LM",
							"x": -0.72656,
							"y": -0.49512,
							"z": 1.33035,
							"scaleX": 1.75,
							"scaleY": 1.23,
							"scaleZ": 0.99,
							"rotationX": 39,
							"rotationY": 39.2,
							"rotationZ": 37.4,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 0.15000000000000005,
									"scaleY": 0.15000000000000002,
									"scaleZ": 0.30000000000000004,
									"rotationX": -1.542772070128081e-25,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 1.8
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													3,
													2
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.3529411764705882,
													0.9921568627450981
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Reactor_Big",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 0.25000000000000006,
									"scaleY": 0.25,
									"scaleZ": 0.40000000000000013,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.6,
												"uvScaleY": 0.6,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1.5,
													1
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.00784313725490196,
													0.2,
													0.5568627450980392
												]
											},
											"isInstance": true
										},
										{
											"type": "object",
											"name": "group"
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Reactor_RB",
							"x": -1.56247,
							"y": 0.50261,
							"z": 1.06877,
							"scaleX": 2.75,
							"scaleY": 1.34,
							"scaleZ": 1.08,
							"rotationX": -7,
							"rotationY": 28.1,
							"rotationZ": -34.7,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 0.15000000000000005,
									"scaleY": 0.15000000000000002,
									"scaleZ": 0.30000000000000004,
									"rotationX": -1.542772070128081e-25,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 1.8
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													3,
													2
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.3529411764705882,
													0.9921568627450981
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Reactor_Big",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 0.25000000000000006,
									"scaleY": 0.25,
									"scaleZ": 0.40000000000000013,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.6,
												"uvScaleY": 0.6,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1.5,
													1
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.00784313725490196,
													0.2,
													0.5568627450980392
												]
											},
											"isInstance": true
										},
										{
											"type": "object",
											"name": "group"
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Reactor_LB",
							"x": -1.56504,
							"y": -0.49535,
							"z": 1.06162,
							"scaleX": 2.75,
							"scaleY": 1.23,
							"scaleZ": 0.99,
							"rotationX": 34.2,
							"rotationY": 29.9,
							"rotationZ": 29,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 0.15000000000000005,
									"scaleY": 0.15000000000000002,
									"scaleZ": 0.30000000000000004,
									"rotationX": -1.542772070128081e-25,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 1.8
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													3,
													2
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.3529411764705882,
													0.9921568627450981
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Reactor_Big",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"x": 1.1102230246251565e-16,
									"z": 1.1102230246251565e-16,
									"scaleX": 0.25000000000000006,
									"scaleY": 0.25,
									"scaleZ": 0.40000000000000013,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.6,
												"uvScaleY": 0.6,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1.5,
													1
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.00784313725490196,
													0.2,
													0.5568627450980392
												]
											},
											"isInstance": true
										},
										{
											"type": "object",
											"name": "group"
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Reactor",
					"target": "FXAnimation.FXRoot.Overlord.root.B_ROOT.B_Body"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Lights",
					"target": "FXAnimation.FXRoot.Overlord.root.B_ROOT.B_Body"
				},
				{
					"type": "light",
					"name": "light_0",
					"editorOnly": true,
					"y": 2.98887,
					"z": -5.95137,
					"power": 3.79,
					"range": 30,
					"size": 2.05,
					"zNear": 0.02
				}
			]
		}
	]
}