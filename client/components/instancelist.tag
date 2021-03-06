import _ from 'lodash';
import { selectInstance } from '../store/action-creators';

<instancelist>
	<div class="list-group">
		<a role="button" each={ instances } onclick={ select } class={ list-group-item: true, active: selected }>
		<span title="invalid instance" show={ invalid }><i class="fa fa-exclamation-triangle"></i></span> { name } 
		<span class="badge">RAM { memoryUsage }%</span></a>
	</div>

	<script>
		this.mixin('redux');
		this.dispatchify({ selectInstance });

		this.subscribe(state => { 
			return { 
				instances: state.instances
			};
		});

		this.select = function () {
			if (!this.selected && !this.invalid) {
				this.selectInstance(this._item);
			}

			return false;
		};
	</script>
</instancelist>