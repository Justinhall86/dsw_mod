{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "Slashes",
			"children": [
				{
					"type": "polygon",
					"name": "SlashDistort",
					"scaleX": 4.2,
					"scaleY": 4.2,
					"scaleZ": 4.2,
					"rotationX": 54.4,
					"rotationY": -23.300000000000004,
					"rotationZ": 6.400000000000001,
					"kind": 1,
					"args": [
						24,
						229.09,
						0.57,
						4
					],
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "Distortion",
									"blend": "Alpha",
									"shadows": false,
									"culling": "None",
									"colorMask": 255
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
								"texture": "Fx/Gradients/T_Square02.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DistortionMap",
							"source": "shaders/DistortionMap.hx",
							"props": {
								"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
								"intensity": 0.006
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 1,
								"scaleY": 1,
								"shiftX": 1.5,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "shiftX",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.056896387643721624,
											"value": -2.425986213684083,
											"mode": 2
										},
										{
											"time": 1.0772718818968174,
											"value": 1.067704238891602,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.5599999999999999
											},
											"nextHandle": {
												"dv": -9.460471999616726e-16,
												"dt": 0.3316719842180907
											}
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
								"useScale": false,
								"wrap": true,
								"progress": 0.5,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/vGrad.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									1,
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
									"keyMode": 1,
									"keys": [
										{
											"time": -0.10818588116757355,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.04818175693045633,
												"dt": -0.49954845585497076
											},
											"nextHandle": {
												"dv": -0.03472222222222221,
												"dt": 0.36
											}
										},
										{
											"time": 0.429333443046102,
											"value": 1.0416666666666667,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9895833333333335,
												"dt": -0.04999999999999993
											},
											"nextHandle": {
												"dv": -1.0069444444444446,
												"dt": 0.05500000000000005
											}
										},
										{
											"time": 1.2099206961497198,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.1388888888888889,
												"dt": -0.615
											},
											"nextHandle": {
												"dv": -0.043250236625664115,
												"dt": 0.19151204777844172
											}
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}