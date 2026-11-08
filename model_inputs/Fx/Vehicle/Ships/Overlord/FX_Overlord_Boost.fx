{
	"type": "fx",
	"cullingRadius": 20,
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
							"name": "FakeFresnel",
							"y": 0.74449,
							"z": -5.46477,
							"scaleX": 6,
							"scaleY": 14,
							"scaleZ": 5.33,
							"rotationX": -90,
							"albedoMap": "Fx/Gradients/circGrad01_invert.png",
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
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
											"loop": true,
											"keys": [
												{
													"time": -6.938893903907228e-18,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.25,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5,
													"value": 0.75,
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
											0,
											0
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "object",
							"name": "Electricity",
							"x": 0.26048,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 2,
										"maxCount": 5,
										"frameCount": 4,
										"frameDivisionY": 4,
										"instScale_rand": 0,
										"warmUpTime": -1.5,
										"enableSort": false,
										"lifeTime": 0.3,
										"burstCount": 3,
										"burstDelay": 0.6,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"emitType": "BurstDuration",
										"emitDuration": 50,
										"instScale": 0.9
									},
									"x": -1.99764,
									"y": -0.04601,
									"z": -3.52748,
									"scaleX": 0.1,
									"scaleY": 0.10000000000000002,
									"scaleZ": 0.1,
									"rotationZ": -90,
									"children": [
										{
											"type": "model",
											"name": "Overlord_Electricity_02",
											"source": "Fx/Meshes_Common/Overlord_Electricity_02.fbx",
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
															"depthTest": "Less",
															"emissive": 20
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 2
													},
													"isInstance": true,
													"children": [
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
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.3267006990762992e-16,
																		"dt": -0.325
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.345
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
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
															0.2,
															0.2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 0,
														"width": 0.45,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															3
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 2,
										"maxCount": 5,
										"frameCount": 4,
										"frameDivisionY": 4,
										"instScale_rand": 0,
										"warmUpTime": -0.75,
										"enableSort": false,
										"lifeTime": 0.3,
										"burstCount": 3,
										"burstDelay": 0.6,
										"instScale": 0.9,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"emitType": "BurstDuration",
										"emitDuration": 50
									},
									"x": -1.99764,
									"y": 0.03979,
									"z": -3.08961,
									"scaleX": 0.1,
									"scaleY": 0.10000000000000002,
									"scaleZ": 0.1,
									"rotationZ": -90,
									"children": [
										{
											"type": "model",
											"name": "Overlord_Electricity_01",
											"source": "Fx/Meshes_Common/Overlord_Electricity_01.fbx",
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
															"depthTest": "Less",
															"emissive": 20
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 2
													},
													"isInstance": true,
													"children": [
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
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.3267006990762992e-16,
																		"dt": -0.325
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.345
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
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
															0.2,
															0.2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 0,
														"width": 0.45,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															4
														]
													}
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