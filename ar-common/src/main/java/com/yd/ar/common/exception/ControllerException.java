
package com.yd.ar.common.exception;


public class ControllerException extends GlobalException {

	/**
	* @Fields serialVersionUID : TODO <br>
	*/ 
	private static final long serialVersionUID = 5601667770792566234L;

	/**
	 * ControllerException
	 * 
	 * @param exception
	 *            <br>
	 */
	public ControllerException(GlobalException exception) {
		super(exception);
	}

	/**
	 * ControllerException
	 * 
	 * @param msg
	 *            <br>
	 */
	public ControllerException(String msg) {
		super(msg);
	}

	/**
	 * UtilException
	 * 
	 * @param code
	 *            <br>
	 * @param msg
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public ControllerException(int code, String msg, Object... params) {
		super(code, msg, params);
	}

	/**
	 * ControllerException
	 * 
	 * @param code
	 *            <br>
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public ControllerException(int code, String arg0, Throwable arg1, Object... params) {
		super(code, arg0, arg1, params);
	}

	/**
	 * ControllerException
	 * 
	 * @param code
	 *            <br>
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 */
	public ControllerException(int code, String arg0, Throwable arg1) {
		super(code, arg0, arg1);
	}

	/**
	 * ControllerException
	 * 
	 * @param code
	 *            <br>
	 * @param msg
	 *            <br>
	 */
	public ControllerException(int code, String msg) {
		super(code, msg);
	}

	/**
	 * ControllerException
	 * 
	 * @param code
	 *            <br>
	 * @param arg0
	 *            <br>
	 */
	public ControllerException(int code, Throwable arg0) {
		super(code, arg0);
	}

	/**
	 * ControllerException
	 * 
	 * @param code
	 *            <br>
	 */
	public ControllerException(int code) {
		super(code);
	}

	/**
	 * ControllerException
	 * 
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public ControllerException(String arg0, GlobalException arg1, Object... params) {
		super(arg0, arg1, params);
	}

	/**
	 * ControllerException
	 * 
	 * @param arg0
	 *            <br>
	 * @param exception
	 *            <br>
	 */
	public ControllerException(String arg0, GlobalException exception) {
		super(arg0, exception);
	}
}
