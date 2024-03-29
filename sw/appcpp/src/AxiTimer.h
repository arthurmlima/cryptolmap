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
	u32 Get_end_tx();
	u32 Get_end_hash();
	u32 Get_end_perm_seq();
	u32 Get_end_perm_sort();
	u32 Get_end_perm_scramble();
	u32 Get_end_diff();
	u32 Get_init_bitxor();
	u32 Get_end_bitxor();
	double Get_ts_tx();
	double Get_ts_hash();
	double Get_ts_perm_seq();
	double Get_ts_perm_sort();
	double Get_ts_perm_scramble();
	double Get_ts_diff();
	double Get_ts_bitxor();
	double Get_ts_all();

	unsigned int startTimer();
	unsigned int stopTimer();

private:
	XTmrCtr m_AxiTimer;
	double m_clockPeriodSeconds;
	double m_timerClockFreq;
	double t_tx;
	double t_hash;
	double t_perm_seq;
	double t_perm_sort;
	double t_perm_scramble;
	double t_diff;
	double t_bitxor;
	double t_all;
	unsigned int m_tick_start;
	unsigned int m_tick_end_tx;
	unsigned int m_tick_end_hash;
	unsigned int m_tick_end_perm_seq;
	unsigned int m_tick_end_perm_sort;
	unsigned int m_tick_end_perm_scramble;
	unsigned int m_tick_end_diff;
	unsigned int m_tick_init_bitxor;
	unsigned int m_tick_end_bitxor;
	unsigned int m_tick_last;

};

#endif /* AXITIMER_H_ */




