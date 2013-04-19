/*
 * Copyright jd
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

package com.jd.bdp.startUp.collector.simulation.support;

import com.jd.bdp.hydra.Span;
import com.jd.bdp.hydra.dubbomonitor.HydraService;
import com.jd.bdp.sending.TestCollectSpanService;

import java.util.List;

/**
 * User: biandi
 * Date: 13-4-10
 * Time: 下午4:24
 */
public class TestHydraService implements HydraService {
    @Override
    public synchronized boolean push(List<Span> span) {
        try {
            Thread.sleep(1000);
//            collectSpanService.setSpans(span);
        }catch (Exception e){
            e.printStackTrace();
        }
        return true;
    }

    private TestCollectSpanService collectSpanService;

    public void setCollectSpanService(TestCollectSpanService collectSpanService) {
        this.collectSpanService = collectSpanService;
    }
}