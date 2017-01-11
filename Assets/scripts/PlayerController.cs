using UnityEngine;
using System.Collections;

public class PlayerController : MonoBehaviour {

	public float Speed;

	private Rigidbody body;

	// Use this for initialization
	void Start() {
		body = GetComponent<Rigidbody>();
	}
	
	// Update is called once per frame
//	void Update() { }

	void FixedUpdate() {
		float hMove = Input.GetAxis("Horizontal");
		float vMove = Input.GetAxis("Vertical");
		Vector3 move = new Vector3(hMove, 0.0f, vMove);
		body.AddForce(move * Speed);
	}
}
