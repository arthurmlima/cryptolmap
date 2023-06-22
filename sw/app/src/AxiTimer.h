/*
 * AxiTimerHelper.h
 *
 *  Created on: 06/07/2015
 *      Author: laraujo
 */

#ifndef AXITIMER_H_
#define AXITIMER_H_

#include "xil_types.h"
#include "xtmrctr.h"
#include "xparameters.h"


class AxiTimer {
public:
	AxiTimer();
	virtual ~AxiTimer();
	unsigned int getElapsedTicks();
	double getElapsedTimerInSeconds();
	unsigned int startTimer();
	unsigned int stopTimer();
	double getClockPeriod();
	double getTimerClockFreq();
private:
	XTmrCtr m_AxiTimer;
	unsigned int m_tickCounter1;
	unsigned int m_tickCounter2;
	double m_clockPeriodSeconds;
	double m_timerClockFreq;
};

#endif /* AXITIMER_H_ */