{
	"type": "fx",
	"cullingRadius": 15,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Hawk",
					"source": "Vehicle/Atreide/Hawk/Hawk.fbx",
					"editorOnly": true,
					"z": -2,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"enabled": false,
							"animation": "Anim/Hawk/Anim_Hawk_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Decals",
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 3,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"scaleX": 7,
							"scaleY": 4,
							"scaleZ": 5,
							"rotationX": -90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
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
										"texture": "Fx/Gradients/Cyl10u_A.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "vOffset",
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
											],
											"loop": true
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
											0.9490196078431372,
											0.21568627450980393,
											0.16078431372549018
										]
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									}
								},
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Front",
											"depthTest": "Greater",
											"colorMask": 15,
											"enableStencil": true,
											"depthWrite": "Off",
											"stencilFailOp": "Keep",
											"depthFailOp": "Keep",
											"stencilPassOp": "Keep",
											"stencilCompare": "Equal",
											"stencilValue": 2,
											"stencilReadMask": 2,
											"stencilWriteMask": 0
										}
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"scaleX": 13,
							"scaleY": 13,
							"scaleZ": 5,
							"albedoMap": "Fx/Gradients/circGrad01.png",
							"fadePower": 3,
							"emissive": 0.1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"enableStencil": true,
											"stencilFailOp": "Keep",
											"depthFailOp": "Keep",
											"stencilPassOp": "Keep",
											"stencilCompare": "Equal",
											"stencilValue": 2,
											"stencilReadMask": 2,
											"stencilWriteMask": 0
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.4
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16960016257684296
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16960016257684296
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.1647924604989077
													}
												},
												{
													"time": 2,
													"value": 0.5,
													"prevHandle": {
														"dv": 0,
														"dt": -0.1647924604989077
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.1647924604989077
													}
												}
											],
											"loop": true
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
											0.9490196078431372,
											0.21568627450980393,
											0.16078431372549018
										]
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.8,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				}
			]
		}
	]
}